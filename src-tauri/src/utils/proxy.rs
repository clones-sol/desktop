//! Utilities for proxying external resources, particularly images.
//!
//! This module provides functions to proxy external resources through the application.

use http::{HeaderMap, HeaderValue};
use serde::Deserialize;

/// Query parameters for proxying an image
#[derive(Deserialize)]
pub struct ProxyImageQuery {
    pub url: String,
}

/// Proxies an image from the internet
///
/// # Arguments
/// * `query` - The query containing the image URL to proxy
///
/// # Returns
/// * `Ok((HeaderMap, Vec<u8>))` if the image was fetched successfully
/// * `Err` if an error occurred
pub async fn proxy_image(query: &ProxyImageQuery) -> Result<(HeaderMap, Vec<u8>), String> {
    let client = reqwest::Client::new();

    match client.get(&query.url).send().await {
        Ok(resp) => {
            if !resp.status().is_success() {
                return Err(format!("Failed to fetch image: {}", resp.status()));
            }

            // Convert reqwest header value into http::HeaderValue
            let content_type_str = resp
                .headers()
                .get("content-type")
                .and_then(|v| v.to_str().ok())
                .unwrap_or("image/png");

            let content_type = HeaderValue::from_str(content_type_str)
                .unwrap_or_else(|_| HeaderValue::from_static("image/png"));

            match resp.bytes().await {
                Ok(bytes) => {
                    let mut headers = HeaderMap::new();
                    headers.insert("Content-Type", content_type);
                    headers.insert("Access-Control-Allow-Origin", HeaderValue::from_static("*"));
                    Ok((headers, bytes.to_vec()))
                }
                Err(e) => Err(format!("Failed to read image bytes: {}", e)),
            }
        }
        Err(e) => Err(format!("Request failed: {}", e)),
    }
}
