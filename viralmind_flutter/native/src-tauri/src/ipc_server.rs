use axum::{
    extract::{Json, Query, State},
    http::{Method, StatusCode},
    response::IntoResponse,
    routing::{get, post},
    Router,
};
use serde::{Deserialize, Serialize};
use std::net::SocketAddr;
use tauri::{AppHandle, Manager};
use tower_http::cors::{Any, CorsLayer};

// Import business logic from the local `core` module
use crate::core::record::{self, Quest};
// Import functions from `commands/general`
use crate::commands::general::{list_apps, take_screenshot};
// Import function from `commands/settings`
use crate::commands::settings::{get_upload_data_allowed, set_upload_data_allowed};
// Import function from `utils/permissions`
use crate::utils::permissions::has_ax_perms;
// Import functions from `commands/recordings`
use crate::commands::recordings::export_recordings;
// Import functions from `commands/tools`
use crate::commands::tools::{check_tools, init_tools};
// Import functions from `core/record`
use crate::core::record::{open_recording_folder, process_recording};
// Import functions from `utils/permissions`
use crate::utils::permissions::{has_record_perms, request_record_perms};
// Import functions from `commands/settings`
use crate::commands::settings::{get_onboarding_complete, set_onboarding_complete};
// Import our new DeepLinkState
use crate::DeepLinkState;

// Helper to wrap AppHandle in the server state
#[derive(Clone)]
pub struct AppState {
    pub app_handle: AppHandle,
}

// Structure for the write_recording_file request
#[derive(Deserialize)]
pub struct WriteFilePayload {
    filename: String,
    content: String,
}

// Structure for the get_recording_file query
#[derive(Deserialize)]
pub struct GetFileQuery {
    filename: String,
}

// Structure for the start_recording request
#[derive(Deserialize)]
pub struct StartRecordingPayload {
    quest: Option<Quest>,
    fps: u32,
}

// Structure for the stop_recording request
#[derive(Deserialize)]
pub struct StopRecordingPayload {
    status: String,
}

// Structure for the `set_upload_data_allowed` payload
#[derive(Deserialize)]
pub struct SetUploadAllowedPayload {
    allowed: bool,
}

// Structure for the has_ax_perms response
#[derive(Serialize)]
pub struct PermissionStatus {
    has_permission: bool,
}

// Structure for the `set_onboarding_complete` payload
#[derive(Deserialize)]
pub struct SetOnboardingCompletePayload {
    complete: bool,
}

// Main function to start the server
pub async fn init(app_handle: AppHandle) {
    let state = AppState { app_handle };

    let cors = CorsLayer::new()
        .allow_methods([Method::GET, Method::POST, Method::DELETE])
        .allow_origin(Any);

    let app = Router::new()
        // GET /recordings: Retrieve a list of all recordings.
        // Used for fetching read-only data, so GET is appropriate.
        .route("/recordings", get(list_recordings_handler))
        // POST /recordings/:id/files: Create a new file within a specific recording.
        // This is a create operation on a sub-resource, making POST suitable.
        .route("/recordings/:id/files", post(write_recording_file_handler).get(get_recording_file_handler))
        // POST /recordings/start: Initiate a new recording session.
        // This is an action that changes server state, so POST is used.
        .route("/recordings/start", post(start_recording_handler))
        // POST /recordings/stop: Stop the current recording session.
        // This is an action that changes server state, so POST is used.
        .route("/recordings/stop", post(stop_recording_handler))
        // DELETE /recordings/:id: Remove a specific recording.
        // Standard RESTful method for resource deletion.
        .route("/recordings/:id", axum::routing::delete(delete_recording_handler))
        // GET /recordings/:id/zip: Retrieve a zip archive of a specific recording.
        // Though it involves creation, the primary action is data retrieval, so GET is acceptable.
        .route("/recordings/:id/zip", get(create_recording_zip_handler))
        // GET /apps: Retrieve a list of installed applications.
        // Read-only data retrieval.
        .route("/apps", get(list_apps_handler))
        // GET /screenshot: Capture and retrieve a screenshot.
        // Idempotent action for data retrieval.
        .route("/screenshot", get(take_screenshot_handler))
        // GET & POST /settings/upload-allowed: GET to read, POST to update the setting.
        // Follows standard practice for resource state management.
        .route(
            "/settings/upload-allowed",
            get(get_upload_data_allowed_handler).post(set_upload_data_allowed_handler),
        )
        // GET /permissions/ax: Check accessibility permissions status.
        // Read-only check.
        .route("/permissions/ax", get(has_ax_perms_handler))
        // GET /permissions/record: Check screen recording permissions status.
        // Read-only check.
        .route("/permissions/record", get(has_record_perms_handler))
        // POST /permissions/record/request: Trigger a request for screen recording permissions.
        // Action that initiates a system prompt.
        .route("/permissions/record/request", post(request_record_perms_handler))
        // GET & POST /onboarding/complete: GET to read, POST to update onboarding status.
        // Standard resource state management.
        .route("/onboarding/complete", get(get_onboarding_complete_handler).post(set_onboarding_complete_handler))
        // POST /tools/init: Trigger the initialization of external tools.
        // Action that changes server state.
        .route("/tools/init", post(init_tools_handler))
        // GET /tools/check: Check the status of external tools.
        // Read-only check.
        .route("/tools/check", get(check_tools_handler))
        // POST /recordings/:id/process: Trigger post-processing for a specific recording.
        // Action performed on a specific resource.
        .route("/recordings/:id/process", post(process_recording_handler))
        // POST /recordings/:id/open: Trigger opening the folder of a specific recording.
        // Action performed on a specific resource.
        .route("/recordings/:id/open", post(open_recording_folder_handler))
        // POST /recordings/export: Trigger an export of all recordings.
        // Action that creates a file for the user to download.
        .route("/recordings/export", post(export_recordings_handler))
        // GET /deeplink: Retrieve the latest deep link URL received by the application.
        .route("/deeplink", get(get_deeplink_handler))
        .with_state(state)
        .layer(cors);

    let addr = SocketAddr::from(([127, 0, 0, 1], 19847));
    println!("[IPC Server] Listening on {}", addr);

    // We launch the server in a Tokio task so as not to block the main Tauri thread
    tokio::spawn(async move {
        let listener = tokio::net::TcpListener::bind(addr).await.unwrap();
        axum::serve(listener, app.into_make_service())
            .await
            .unwrap();
    });
}

// Handler to list recordings
async fn list_recordings_handler(
    State(state): State<AppState>,
) -> Result<impl IntoResponse, (StatusCode, String)> {
    match record::list_recordings(state.app_handle).await {
        Ok(recordings) => Ok((StatusCode::OK, Json(recordings))),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e.to_string())),
    }
}

// Handler to write a recording file
async fn write_recording_file_handler(
    State(state): State<AppState>,
    axum::extract::Path(id): axum::extract::Path<String>,
    Json(payload): Json<WriteFilePayload>,
) -> Result<StatusCode, (StatusCode, String)> {
    match record::write_recording_file(
        state.app_handle,
        id,
        payload.filename,
        payload.content,
    )
    .await
    {
        Ok(_) => Ok(StatusCode::OK),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e.to_string())),
    }
}

// Handler to get a recording file
async fn get_recording_file_handler(
    State(state): State<AppState>,
    axum::extract::Path(id): axum::extract::Path<String>,
    Query(query): Query<GetFileQuery>,
) -> Result<impl IntoResponse, (StatusCode, String)> {
    match record::get_recording_file(
        state.app_handle,
        id,
        query.filename,
        Some(false), // as_base64
        Some(false), // as_path
    )
    .await
    {
        Ok(content) => Ok((StatusCode::OK, content)),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e.to_string())),
    }
}

// Handler to start a recording
async fn start_recording_handler(
    State(state): State<AppState>,
    Json(payload): Json<StartRecordingPayload>,
) -> Result<StatusCode, (StatusCode, String)> {
    // We get the "QuestState" from the Tauri state manager via the AppHandle
    let quest_state: tauri::State<record::QuestState> = state.app_handle.state();
    match record::start_recording(
        state.app_handle.clone(),
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

// Handler to stop a recording
async fn stop_recording_handler(
    State(state): State<AppState>,
    Json(payload): Json<StopRecordingPayload>,
) -> Result<impl IntoResponse, (StatusCode, String)> {
    let quest_state: tauri::State<record::QuestState> = state.app_handle.state();
    match record::stop_recording(state.app_handle.clone(), quest_state, Some(payload.status)).await {
        Ok(recording_id) => Ok((StatusCode::OK, recording_id)),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e.to_string())),
    }
}

// Handler to delete a recording
async fn delete_recording_handler(
    State(state): State<AppState>,
    axum::extract::Path(id): axum::extract::Path<String>,
) -> Result<StatusCode, (StatusCode, String)> {
    match record::delete_recording(state.app_handle, id).await {
        Ok(_) => Ok(StatusCode::OK),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e.to_string())),
    }
}

// Handler to create a zip of a recording
async fn create_recording_zip_handler(
    State(state): State<AppState>,
    axum::extract::Path(id): axum::extract::Path<String>,
) -> Result<impl IntoResponse, (StatusCode, String)> {
    match record::create_recording_zip(state.app_handle, id.clone()).await {
        Ok(zip_data) => {
            let filename = format!("attachment; filename=\"recording_{}.zip\"", id);
            let mut headers = axum::http::HeaderMap::new();
            headers.insert(
                axum::http::header::CONTENT_TYPE,
                "application/zip".parse().unwrap(),
            );
            headers.insert(
                axum::http::header::CONTENT_DISPOSITION,
                filename.parse().unwrap(),
            );
            Ok((headers, zip_data))
        }
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e.to_string())),
    }
}

// Handler to list applications
async fn list_apps_handler(
    State(state): State<AppState>,
) -> Result<impl IntoResponse, (StatusCode, String)> {
    // The second parameter `include_icons` is an `Option<bool>`, we set it to `Some(true)` to get the icons.
    match list_apps(state.app_handle, Some(true)).await {
        Ok(apps) => Ok((StatusCode::OK, Json(apps))),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e.to_string())),
    }
}

// Handler to take a screenshot
async fn take_screenshot_handler() -> Result<impl IntoResponse, (StatusCode, String)> {
    match take_screenshot().await {
        Ok(base64_image) => Ok((StatusCode::OK, base64_image)),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e.to_string())),
    }
}

// Handler for `get_upload_data_allowed`
async fn get_upload_data_allowed_handler(State(state): State<AppState>) -> impl IntoResponse {
    (
        StatusCode::OK,
        Json(get_upload_data_allowed(state.app_handle)),
    )
}

// Handler for `set_upload_data_allowed`
async fn set_upload_data_allowed_handler(
    State(state): State<AppState>,
    Json(payload): Json<SetUploadAllowedPayload>,
) -> Result<StatusCode, (StatusCode, String)> {
    match set_upload_data_allowed(state.app_handle, payload.allowed) {
        Ok(_) => Ok(StatusCode::OK),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e.to_string())),
    }
}

// Handler for `has_ax_perms`
async fn has_ax_perms_handler() -> impl IntoResponse {
    let status = has_ax_perms();
    (
        StatusCode::OK,
        Json(PermissionStatus {
            has_permission: status,
        }),
    )
}

// --- Handlers for permissions and settings ---

async fn has_record_perms_handler() -> impl IntoResponse {
    (
        StatusCode::OK,
        Json(PermissionStatus {
            has_permission: has_record_perms(),
        }),
    )
}

async fn request_record_perms_handler() -> StatusCode {
    request_record_perms();
    StatusCode::OK
}

async fn get_onboarding_complete_handler(State(state): State<AppState>) -> impl IntoResponse {
    let status = get_onboarding_complete(state.app_handle);
    (
        StatusCode::OK,
        Json(PermissionStatus {
            has_permission: status,
        }),
    )
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

// --- Handlers for tools ---

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

// --- Handlers for recording actions ---

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
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e.to_string())),
    }
}

// --- Handler for deep links ---

async fn get_deeplink_handler(
    State(state): State<AppState>,
) -> Result<impl IntoResponse, (StatusCode, String)> {
    let deeplink_state = state.app_handle.state::<DeepLinkState>();
    let mut url = deeplink_state.0.lock().unwrap();
    
    // Take the URL from the state, leaving `None` in its place.
    if let Some(url_str) = url.take() {
        Ok((StatusCode::OK, Json(serde_json::json!({ "url": url_str }))))
    } else {
        Ok((StatusCode::OK, Json(serde_json::json!({ "url": null }))))
    }
} 