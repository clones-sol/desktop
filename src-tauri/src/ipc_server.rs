use axum::{
    extract::{Json, Query, State},
    http::{Method, StatusCode},
    response::IntoResponse,
    routing::{get, post},
    Router,
};
use http::header::{ACCEPT, CONTENT_TYPE};

use serde::{Deserialize, Serialize};
use std::net::SocketAddr;
use tauri::{AppHandle, Manager};
use tower_http::cors::{Any, CorsLayer};

// Import business logic from the local `core` module
use crate::core::record::{self, Demonstration};
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
use crate::core::record::{export_recording_zip, open_recording_folder, process_recording};
// Import functions from `utils/permissions`
use crate::utils::permissions::{has_record_perms, request_record_perms};
// Import functions from `commands/settings`
use crate::commands::settings::{get_onboarding_complete, set_onboarding_complete};
// Import functions from `commands/transaction`
use crate::commands::transaction::{
    cleanup_old_transactions, generate_session_token, generate_transaction_deep_link,
    get_transaction_request, handle_transaction_callback, list_pending_transactions,
    prepare_transaction_request, update_transaction_status, TransactionRequest, TransactionStatus,
};
// Import functions from `utils/windows`
use crate::utils::windows::{
    get_all_displays_size, get_window_size, resize_window, set_window_position,
    set_window_resizable, ResizeWindowPayload, SetWindowAlignmentPayload,
};
// Import functions from `utils/platform`
use crate::utils::platform::get_platform;
// Import functions from `utils/url`
use crate::utils::url::{open_external_url, OpenUrlPayload};
// Import functions from `utils/proxy`
use crate::utils::proxy::{proxy_image, ProxyImageQuery};
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
    #[serde(rename = "asPath")]
    as_path: Option<bool>,
    #[serde(rename = "asBase64")]
    as_base64: Option<bool>,
}

// Structure for the start_recording request
#[derive(Deserialize)]
pub struct StartRecordingPayload {
    demonstration: Option<Demonstration>,
    fps: u32,
}

// Structure for the stop_recording request
#[derive(Deserialize)]
pub struct StopRecordingPayload {
    status: String,
}

#[derive(Deserialize)]
pub struct Segment {
    start: f64,
    end: f64,
}

#[derive(Deserialize)]
pub struct ApplyEditsPayload {
    segments: Vec<Segment>,
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

// Structures for transaction endpoints
#[derive(Deserialize)]
pub struct PrepareTransactionPayload {
    transaction_type: String,
    session_token: String,
    creator: Option<String>,
    token: Option<String>,
    amount: Option<String>,
    pool_address: Option<String>,
}

#[derive(Deserialize)]
pub struct GenerateDeepLinkPayload {
    request: serde_json::Value,
    website_base_url: Option<String>,
}

#[derive(Deserialize)]
pub struct UpdateTransactionStatusPayload {
    request_id: String,
    status: String,
    gas_estimate: Option<serde_json::Value>,
}

#[derive(Deserialize)]
pub struct TransactionCallbackPayload {
    status: String,
    tx_hash: Option<String>,
    message: Option<String>,
    transaction_type: String,
}

// Structure for the `set_window_resizable` payload
#[derive(Deserialize)]
pub struct SetWindowResizablePayload {
    resizable: bool,
}

// Main function to start the server
pub async fn init(app_handle: AppHandle) {
    let state = AppState { app_handle };

    let cors = CorsLayer::new()
        .allow_methods([Method::GET, Method::POST, Method::DELETE])
        .allow_origin(Any)
        .allow_headers([ACCEPT, CONTENT_TYPE]);

    let app = Router::new()
        // GET /recordings: Retrieve a list of all recordings.
        // Used for fetching read-only data, so GET is appropriate.
        .route("/recordings", get(list_recordings_handler))
        // POST /recordings/:id/files: Create a new file within a specific recording.
        // This is a create operation on a sub-resource, making POST suitable.
        .route(
            "/recordings/:id/files",
            post(write_recording_file_handler).get(get_recording_file_handler),
        )
        // POST /recordings/start: Initiate a new recording session.
        // This is an action that changes server state, so POST is used.
        .route("/recordings/start", post(start_recording_handler))
        // POST /recordings/stop: Stop the current recording session.
        // This is an action that changes server state, so POST is used.
        .route("/recordings/stop", post(stop_recording_handler))
        // DELETE /recordings/:id: Remove a specific recording.
        // Standard RESTful method for resource deletion.
        .route(
            "/recordings/:id",
            axum::routing::delete(delete_recording_handler),
        )
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
        .route("/permissions/ax", get(has_ax_perms_handler))
        // GET /permissions/record: Check screen recording permissions status.
        .route("/permissions/record", get(has_record_perms_handler))
        // POST /permissions/record/request: Trigger a request for screen recording permissions.
        .route(
            "/permissions/record/request",
            post(request_record_perms_handler),
        )
        // GET & POST /onboarding/complete: GET to read, POST to update onboarding status.
        .route(
            "/onboarding/complete",
            get(get_onboarding_complete_handler).post(set_onboarding_complete_handler),
        )
        // POST /tools/init: Trigger the initialization of external tools.
        .route("/tools/init", post(init_tools_handler))
        // GET /tools/check: Check the status of external tools.
        .route("/tools/check", get(check_tools_handler))
        // POST /recordings/:id/process: Trigger post-processing for a specific recording.
        .route("/recordings/:id/process", post(process_recording_handler))
        // POST /recordings/:id/open: Trigger opening the folder of a specific recording.
        .route("/recordings/:id/open", post(open_recording_folder_handler))
        // POST /recordings/:id/export: Trigger an export of a specific recording.
        .route("/recordings/:id/export", post(export_recording_handler))
        // POST /recordings/export: Trigger an export of all recordings.
        .route("/recordings/export", post(export_recordings_handler))
        // GET /deeplink: Retrieve the latest deep link URL received by the application.
        .route("/deeplink", get(get_deeplink_handler))
        // POST /open-url: Open an external URL.
        .route("/open-url", post(open_external_url_handler))
        // GET /platform: Get the platform of the current system.
        .route("/platform", get(get_platform_handler))
        // GET /proxy-image: Proxy an image from the internet.
        .route("/proxy-image", get(proxy_image_handler))
        // POST /resize-window: Resize the window.
        .route("/window/resize", post(resize_window_handler))
        // GET /window/size: Get the size of the window.
        .route("/window/size", get(get_window_size_handler))
        // POST /window/position: Set the position of the window.
        .route("/window/position", post(set_window_position_handler))
        // POST /window/resizable: Set the resizability of the window.
        .route("/window/resizable", post(set_window_resizable_handler))
        // GET /displays/size: Get the size of all displays.
        .route("/displays/size", get(get_all_displays_size_handler))
        // POST /recordings/:id/apply-edits: Apply edits to a specific recording.
        .route("/recordings/:id/apply-edits", post(apply_edits_handler))
        // Transaction endpoints
        // GET /transaction/session: Generate a new session token
        .route("/transaction/session", get(generate_session_token_handler))
        // POST /transaction/prepare: Prepare a transaction request
        .route(
            "/transaction/prepare",
            post(prepare_transaction_request_handler),
        )
        // POST /transaction/deeplink: Generate deep link URL
        .route("/transaction/deeplink", post(generate_deep_link_handler))
        // GET /transaction/:id: Get transaction request by ID
        .route("/transaction/:id", get(get_transaction_request_handler))
        // POST /transaction/:id/status: Update transaction status
        .route(
            "/transaction/:id/status",
            post(update_transaction_status_handler),
        )
        // GET /transaction/pending: List pending transactions
        .route(
            "/transaction/pending",
            get(list_pending_transactions_handler),
        )
        // POST /transaction/cleanup: Clean up old transactions
        .route(
            "/transaction/cleanup",
            post(cleanup_old_transactions_handler),
        )
        // POST /transaction/callback: Handle transaction callback
        .route(
            "/transaction/callback",
            post(handle_transaction_callback_handler),
        )
        .with_state(state)
        .layer(cors);

    let addr = SocketAddr::from(([127, 0, 0, 1], 19847));
    println!("[IPC Server] Listening on {}", addr);

    // We launch the server in a Tokio task so as not to block the main Tauri thread
    tokio::spawn(async move {
        match tokio::net::TcpListener::bind(addr).await {
            Ok(listener) => {
                log::info!("[IPC Server] Successfully bound to {}", addr);
                if let Err(e) = axum::serve(listener, app.into_make_service()).await {
                    log::error!("[IPC Server] Server error: {}", e);
                }
            }
            Err(e) => {
                log::error!("[IPC Server] Failed to bind to {}: {}", addr, e);
            }
        }
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
    match record::write_recording_file(state.app_handle, id, payload.filename, payload.content)
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
        query.as_base64,
        query.as_path,
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
    // We get the "DemonstrationState" from the Tauri state manager via the AppHandle
    let demonstration_state: tauri::State<record::DemonstrationState> = state.app_handle.state();
    match record::start_recording(
        state.app_handle.clone(),
        demonstration_state,
        payload.demonstration,
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
    let demonstration_state: tauri::State<record::DemonstrationState> = state.app_handle.state();
    match record::stop_recording(
        state.app_handle.clone(),
        demonstration_state,
        Some(payload.status),
    )
    .await
    {
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

async fn init_tools_handler(
    State(state): State<AppState>,
) -> Result<StatusCode, (StatusCode, String)> {
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

async fn export_recording_handler(
    State(state): State<AppState>,
    axum::extract::Path(id): axum::extract::Path<String>,
) -> Result<impl IntoResponse, (StatusCode, String)> {
    match export_recording_zip(id, state.app_handle).await {
        Ok(path) => Ok((StatusCode::OK, path)),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e.to_string())),
    }
}

async fn export_recordings_handler(
    State(state): State<AppState>,
) -> Result<impl IntoResponse, (StatusCode, String)> {
    match export_recordings(state.app_handle).await {
        Ok(path) => Ok((StatusCode::OK, path)),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e.to_string())),
    }
}

async fn apply_edits_handler(
    State(state): State<AppState>,
    axum::extract::Path(id): axum::extract::Path<String>,
    Json(payload): Json<ApplyEditsPayload>,
) -> Result<StatusCode, (StatusCode, String)> {
    let segments_to_keep: Vec<(f64, f64)> = payload
        .segments
        .into_iter()
        .map(|s| (s.start, s.end))
        .collect();
    match record::apply_edits(state.app_handle, id, segments_to_keep).await {
        Ok(_) => Ok(StatusCode::OK),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e.to_string())),
    }
}

// Handler to get the deep link URL
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

// Handler to open an external URL
pub async fn open_external_url_handler(
    State(state): State<AppState>,
    Json(payload): Json<OpenUrlPayload>,
) -> Result<StatusCode, (StatusCode, String)> {
    match open_external_url(&state.app_handle, &payload) {
        Ok(_) => Ok(StatusCode::OK),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e)),
    }
}

// Get the platform of the current system
pub async fn get_platform_handler(State(_state): State<AppState>) -> String {
    get_platform()
}

// Handler to proxy an image from the internet
async fn proxy_image_handler(
    Query(query): Query<ProxyImageQuery>,
) -> Result<impl IntoResponse, (StatusCode, String)> {
    match proxy_image(&query).await {
        Ok((headers, bytes)) => Ok((headers, bytes)),
        Err(e) => Err((StatusCode::BAD_REQUEST, e)),
    }
}

// Handler to resize the window
async fn resize_window_handler(
    State(state): State<AppState>,
    Json(payload): Json<ResizeWindowPayload>,
) -> Result<StatusCode, (StatusCode, String)> {
    match resize_window(&state.app_handle, &payload) {
        Ok(_) => Ok(StatusCode::OK),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e)),
    }
}

// Handler to set the position of the window
async fn set_window_position_handler(
    State(state): State<AppState>,
    Json(payload): Json<SetWindowAlignmentPayload>,
) -> Result<StatusCode, (StatusCode, String)> {
    match set_window_position(&state.app_handle, &payload) {
        Ok(_) => Ok(StatusCode::OK),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e)),
    }
}

// Handler to get the size of the window
pub async fn get_window_size_handler(
    State(state): State<AppState>,
) -> Result<impl IntoResponse, (StatusCode, String)> {
    match get_window_size(&state.app_handle) {
        Ok(size) => Ok((StatusCode::OK, Json(size))),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e)),
    }
}

// Handler to set the resizability of the window
async fn set_window_resizable_handler(
    State(state): State<AppState>,
    Json(payload): Json<SetWindowResizablePayload>,
) -> Result<StatusCode, (StatusCode, String)> {
    match set_window_resizable(&state.app_handle, payload.resizable) {
        Ok(_) => Ok(StatusCode::OK),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e)),
    }
}

// Handler to get the size of all displays
async fn get_all_displays_size_handler() -> Result<impl IntoResponse, (StatusCode, String)> {
    match get_all_displays_size() {
        Ok(size) => Ok((StatusCode::OK, Json(size))),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e)),
    }
}

// Transaction handlers

// Handler to generate a new session token
async fn generate_session_token_handler() -> Result<impl IntoResponse, (StatusCode, String)> {
    match generate_session_token() {
        Ok(token) => Ok((StatusCode::OK, Json(token))),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e)),
    }
}

// Handler to prepare a transaction request
async fn prepare_transaction_request_handler(
    State(state): State<AppState>,
    Json(payload): Json<PrepareTransactionPayload>,
) -> Result<impl IntoResponse, (StatusCode, String)> {
    match prepare_transaction_request(
        state.app_handle,
        payload.transaction_type,
        payload.session_token,
        payload.creator,
        payload.token,
        payload.amount,
        payload.pool_address,
    )
    .await
    {
        Ok(request) => Ok((StatusCode::OK, Json(request))),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e)),
    }
}

// Handler to generate deep link URL
async fn generate_deep_link_handler(
    Json(payload): Json<GenerateDeepLinkPayload>,
) -> Result<impl IntoResponse, (StatusCode, String)> {
    // Convert JSON value to TransactionRequest
    let request: TransactionRequest = match serde_json::from_value(payload.request) {
        Ok(req) => req,
        Err(e) => {
            return Err((
                StatusCode::BAD_REQUEST,
                format!("Invalid request format: {}", e),
            ))
        }
    };

    match generate_transaction_deep_link(request, payload.website_base_url) {
        Ok(url) => Ok((StatusCode::OK, Json(url))),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e)),
    }
}

// Handler to get transaction request by ID
async fn get_transaction_request_handler(
    State(state): State<AppState>,
    axum::extract::Path(request_id): axum::extract::Path<String>,
) -> Result<impl IntoResponse, (StatusCode, String)> {
    match get_transaction_request(state.app_handle, request_id).await {
        Ok(Some(request)) => Ok((StatusCode::OK, Json(request))),
        Ok(None) => Err((
            StatusCode::NOT_FOUND,
            "Transaction request not found".to_string(),
        )),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e)),
    }
}

// Handler to update transaction status
async fn update_transaction_status_handler(
    State(state): State<AppState>,
    axum::extract::Path(request_id): axum::extract::Path<String>,
    Json(payload): Json<UpdateTransactionStatusPayload>,
) -> Result<StatusCode, (StatusCode, String)> {
    // Parse status
    let status = match payload.status.as_str() {
        "pending" => TransactionStatus::Pending,
        "validating" => TransactionStatus::Validating,
        "ready" => TransactionStatus::Ready,
        "executing" => TransactionStatus::Executing,
        "completed" => TransactionStatus::Completed,
        "failed" => TransactionStatus::Failed,
        "cancelled" => TransactionStatus::Cancelled,
        _ => return Err((StatusCode::BAD_REQUEST, "Invalid status".to_string())),
    };

    // Parse gas estimate if provided
    let gas_estimate = if let Some(estimate_json) = payload.gas_estimate {
        match serde_json::from_value(estimate_json) {
            Ok(estimate) => Some(estimate),
            Err(e) => {
                return Err((
                    StatusCode::BAD_REQUEST,
                    format!("Invalid gas estimate: {}", e),
                ))
            }
        }
    } else {
        None
    };

    match update_transaction_status(state.app_handle, request_id, status, gas_estimate).await {
        Ok(_) => Ok(StatusCode::OK),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e)),
    }
}

// Handler to list pending transactions
async fn list_pending_transactions_handler(
    State(state): State<AppState>,
) -> Result<impl IntoResponse, (StatusCode, String)> {
    match list_pending_transactions(state.app_handle).await {
        Ok(transactions) => Ok((StatusCode::OK, Json(transactions))),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e)),
    }
}

// Handler to clean up old transactions
async fn cleanup_old_transactions_handler(
    State(state): State<AppState>,
) -> Result<impl IntoResponse, (StatusCode, String)> {
    match cleanup_old_transactions(state.app_handle).await {
        Ok(count) => Ok((StatusCode::OK, Json(count))),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e)),
    }
}

// Handler to handle transaction callback
async fn handle_transaction_callback_handler(
    State(state): State<AppState>,
    Json(payload): Json<TransactionCallbackPayload>,
) -> Result<StatusCode, (StatusCode, String)> {
    match handle_transaction_callback(
        state.app_handle,
        payload.status,
        payload.tx_hash,
        payload.message,
        payload.transaction_type,
    )
    .await
    {
        Ok(_) => Ok(StatusCode::OK),
        Err(e) => Err((StatusCode::INTERNAL_SERVER_ERROR, e)),
    }
}
