use axum::{
    extract::{Json, State},
    http::{Method, StatusCode},
    response::IntoResponse,
    routing::{get, post},
    Router,
};
use serde::Deserialize;
use std::net::SocketAddr;
use tauri::AppHandle;
use tower_http::cors::{Any, CorsLayer};

// On importe la logique métier depuis le module `core` local
use crate::core::record::{self, Quest};
// On importe les fonctions de `commands/general`
use crate::commands::general::{list_apps, take_screenshot};
// On importe la fonction de `commands/settings`
use crate::commands::settings::set_upload_data_allowed;
// On importe la fonction de `utils/permissions`
use crate::utils::permissions::has_ax_perms;
// On importe les fonctions de `commands/recordings`
use crate::commands::recordings::export_recordings;
// On importe les fonctions de `commands/tools`
use crate::commands::tools::{check_tools, init_tools};
// On importe les fonctions de `core/record`
use crate::core::record::{open_recording_folder, process_recording};
// On importe les fonctions de `utils/permissions`
use crate::utils::permissions::{has_record_perms, request_record_perms};
// On importe les fonctions de `commands/settings`
use crate::commands::settings::{get_onboarding_complete, set_onboarding_complete};

// Helper pour wrapper l'AppHandle dans l'état du serveur
#[derive(Clone)]
pub struct AppState {
    pub app_handle: AppHandle,
}

// Structure pour la requête de write_recording_file
#[derive(Deserialize)]
pub struct WriteFilePayload {
    recording_id: String,
    filename: String,
    content: String,
}

// Structure pour la requête de start_recording
#[derive(Deserialize)]
pub struct StartRecordingPayload {
    quest: Option<Quest>,
    fps: u32,
}

// Structure pour le payload de `set_upload_data_allowed`
#[derive(Deserialize)]
pub struct SetUploadAllowedPayload {
    allowed: bool,
}

// Structure pour la réponse de has_ax_perms
#[derive(Serialize)]
pub struct PermissionStatus {
    has_permission: bool,
}

// Structure pour le payload de `set_onboarding_complete`
#[derive(Deserialize)]
pub struct SetOnboardingCompletePayload {
    complete: bool,
}

// Fonction principale pour démarrer le serveur
pub async fn init(app_handle: AppHandle) {
    let state = AppState { app_handle };

    let cors = CorsLayer::new()
        .allow_methods([Method::GET, Method::POST, Method::DELETE])
        .allow_origin(Any);

    let app = Router::new()
        .route("/recordings", get(list_recordings_handler))
        .route("/recording/file", post(write_recording_file_handler))
        .route("/recording/start", post(start_recording_handler))
        .route("/recording/:id", axum::routing::delete(delete_recording_handler))
        .route("/apps", get(list_apps_handler))
        .route("/screenshot", get(take_screenshot_handler))
        .route("/settings/upload-allowed", post(set_upload_data_allowed_handler))
        .route("/permissions/ax", get(has_ax_perms_handler))
        .route("/permissions/record", get(has_record_perms_handler))
        .route("/permissions/record/request", post(request_record_perms_handler))
        .route("/onboarding/complete", get(get_onboarding_complete_handler).post(set_onboarding_complete_handler))
        .route("/tools/init", post(init_tools_handler))
        .route("/tools/check", get(check_tools_handler))
        .route("/recording/:id/process", post(process_recording_handler))
        .route("/recording/:id/open", post(open_recording_folder_handler))
        .route("/recordings/export", post(export_recordings_handler))
        .with_state(state)
        .layer(cors);

    let addr = SocketAddr::from(([127, 0, 0, 1], 19847));
    println!("[IPC Server] Listening on {}", addr);

    // On lance le serveur dans une tâche Tokio pour ne pas bloquer le thread principal de Tauri
    tokio::spawn(async move {
        axum::Server::bind(&addr)
            .serve(app.into_make_service())
            .await
            .unwrap();
    });
}

// Handler pour lister les enregistrements
async fn list_recordings_handler(
    State(state): State<AppState>,
) -> Result<impl IntoResponse, (StatusCode, String)> {
    match record::list_recordings(state.app_handle).await {
        Ok(recordings) => Ok((StatusCode::OK, Json(recordings))),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e.to_string())),
    }
}

// Handler pour écrire un fichier d'enregistrement
async fn write_recording_file_handler(
    State(state): State<AppState>,
    Json(payload): Json<WriteFilePayload>,
) -> Result<StatusCode, (StatusCode, String)> {
    match record::write_recording_file(
        state.app_handle,
        payload.recording_id,
        payload.filename,
        payload.content,
    )
    .await
    {
        Ok(_) => Ok(StatusCode::OK),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e.to_string())),
    }
}

// Handler pour démarrer un enregistrement
async fn start_recording_handler(
    State(state): State<AppState>,
    Json(payload): Json<StartRecordingPayload>,
) -> Result<StatusCode, (StatusCode, String)> {
    // On récupère le "QuestState" depuis le state manager de Tauri via l'AppHandle
    let quest_state: tauri::State<record::QuestState> = state.app_handle.state();
    match record::start_recording(
        state.app_handle,
        quest_state,
        payload.quest,
        payload.fps,
    )
    .await
    {
        Ok(_) => Ok(StatusCode::OK),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e.to_string())),
    }
}

// Handler pour supprimer un enregistrement
async fn delete_recording_handler(
    State(state): State<AppState>,
    axum::extract::Path(id): axum::extract::Path<String>,
) -> Result<StatusCode, (StatusCode, String)> {
    match record::delete_recording(state.app_handle, id).await {
        Ok(_) => Ok(StatusCode::OK),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e.to_string())),
    }
}

// Handler pour lister les applications
async fn list_apps_handler(
    State(state): State<AppState>,
) -> Result<impl IntoResponse, (StatusCode, String)> {
    // Le second paramètre `include_icons` est un `Option<bool>`, on met `Some(true)` pour avoir les icônes.
    match list_apps(state.app_handle, Some(true)).await {
        Ok(apps) => Ok((StatusCode::OK, Json(apps))),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e.to_string())),
    }
}

// Handler pour prendre une capture d'écran
async fn take_screenshot_handler() -> Result<impl IntoResponse, (StatusCode, String)> {
    match take_screenshot().await {
        Ok(base64_image) => Ok((StatusCode::OK, base64_image)),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e.to_string())),
    }
}

// Handler pour `set_upload_data_allowed`
async fn set_upload_data_allowed_handler(
    State(state): State<AppState>,
    Json(payload): Json<SetUploadAllowedPayload>,
) -> Result<StatusCode, (StatusCode, String)> {
    match set_upload_data_allowed(state.app_handle, payload.allowed) {
        Ok(_) => Ok(StatusCode::OK),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e.to_string())),
    }
}

// Handler pour `has_ax_perms`
async fn has_ax_perms_handler() -> impl IntoResponse {
    let status = has_ax_perms();
    (StatusCode::OK, Json(PermissionStatus { has_permission: status }))
}

// --- Handlers pour les permissions et settings ---

async fn has_record_perms_handler() -> impl IntoResponse {
    (StatusCode::OK, Json(PermissionStatus { has_permission: has_record_perms() }))
}

async fn request_record_perms_handler() -> StatusCode {
    request_record_perms();
    StatusCode::OK
}

async fn get_onboarding_complete_handler(State(state): State<AppState>) -> impl IntoResponse {
    let status = get_onboarding_complete(state.app_handle);
    (StatusCode::OK, Json(PermissionStatus { has_permission: status }))
}

async fn set_onboarding_complete_handler(
    State(state): State<AppState>,
    Json(payload): Json<SetOnboardingCompletePayload>,
) -> Result<StatusCode, (StatusCode, String)> {
    match set_onboarding_complete(state.app_handle, payload.complete) {
        Ok(_) => Ok(StatusCode::OK),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e)),
    }
}

// --- Handlers pour les outils ---

async fn init_tools_handler(State(state): State<AppState>) -> Result<StatusCode, (StatusCode, String)> {
    match init_tools(state.app_handle).await {
        Ok(_) => Ok(StatusCode::OK),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e.to_string())),
    }
}

async fn check_tools_handler() -> Result<impl IntoResponse, (StatusCode, String)> {
    match check_tools().await {
        Ok(status) => Ok((StatusCode::OK, Json(status))),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e.to_string())),
    }
}

// --- Handlers pour les actions sur les enregistrements ---

async fn process_recording_handler(
    State(state): State<AppState>,
    axum::extract::Path(id): axum::extract::Path<String>,
) -> Result<StatusCode, (StatusCode, String)> {
    match process_recording(state.app_handle, id).await {
        Ok(_) => Ok(StatusCode::OK),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e.to_string())),
    }
}

async fn open_recording_folder_handler(
    State(state): State<AppState>,
    axum::extract::Path(id): axum::extract::Path<String>,
) -> Result<StatusCode, (StatusCode, String)> {
    match open_recording_folder(state.app_handle, id).await {
        Ok(_) => Ok(StatusCode::OK),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e.to_string())),
    }
}

async fn export_recordings_handler(State(state): State<AppState>) -> Result<impl IntoResponse, (StatusCode, String)> {
    match export_recordings(state.app_handle).await {
        Ok(path) => Ok((StatusCode::OK, path)),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e)),
    }
} 