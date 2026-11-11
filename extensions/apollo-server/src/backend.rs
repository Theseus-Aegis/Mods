//! Talking to Minotaur's Apollo API (`/apollo/v1/server/...`).

use std::fs;
use std::time::Duration;

use reqwest::blocking::Client;
use serde_json::Value;

pub const DEFAULT_URL: &str = "http://minotaur:8000/apollo/v1/server";
pub const CONFIG_FILE: &str = "apollo-server.cfg";
const TIMEOUT: Duration = Duration::from_secs(10);

/// Where requests go. The real one is HTTP; tests use a fake.
pub trait Backend: Send + Sync + 'static {
    /// GET `path` (relative to the API's base), the response body on success.
    fn get(&self, path: &str) -> Result<String, String>;
    /// POST `body` as JSON to `path`, the response body on success.
    fn post(&self, path: &str, body: &Value) -> Result<String, String>;
}

pub struct Config {
    pub url: String,
    pub token: String,
}

impl Config {
    /// From `APOLLO_SERVER_URL` / `APOLLO_SERVER_TOKEN`, else `apollo-server.cfg` next to the
    /// server (lines `url = ...` and `token = ...`; `#` starts a comment).
    pub fn load() -> Self {
        let file = fs::read_to_string(CONFIG_FILE).unwrap_or_default();
        Self::from_sources(&file, std::env::var("APOLLO_SERVER_URL").ok(), std::env::var("APOLLO_SERVER_TOKEN").ok())
    }

    pub fn from_sources(file: &str, env_url: Option<String>, env_token: Option<String>) -> Self {
        let mut url = None;
        let mut token = None;
        for line in file.lines() {
            let line = line.split('#').next().unwrap_or("").trim();
            if let Some((key, value)) = line.split_once('=') {
                let value = value.trim().trim_matches('"').to_string();
                match key.trim() {
                    "url" => url = Some(value),
                    "token" => token = Some(value),
                    _ => {}
                }
            }
        }
        Self {
            url: env_url.or(url).unwrap_or_else(|| DEFAULT_URL.to_string()).trim_end_matches('/').to_string(),
            token: env_token.or(token).unwrap_or_default(),
        }
    }
}

pub struct Http {
    client: Client,
    config: Config,
}

impl Http {
    pub fn new(config: Config) -> Self {
        let client = Client::builder()
            .timeout(TIMEOUT)
            .user_agent(concat!("tac-apollo-server/", env!("CARGO_PKG_VERSION")))
            .build()
            .expect("HTTP client");
        Self { client, config }
    }

    fn url(&self, path: &str) -> String {
        format!("{}{}", self.config.url, path)
    }

    fn finish(response: reqwest::Result<reqwest::blocking::Response>) -> Result<String, String> {
        let response = response.map_err(|e| e.to_string())?;
        let status = response.status();
        let text = response.text().map_err(|e| e.to_string())?;
        if status.is_success() {
            Ok(text)
        } else {
            Err(format!("{status}: {text}"))
        }
    }
}

impl Backend for Http {
    fn get(&self, path: &str) -> Result<String, String> {
        Self::finish(self.client.get(self.url(path)).bearer_auth(&self.config.token).send())
    }

    fn post(&self, path: &str, body: &Value) -> Result<String, String> {
        Self::finish(self.client.post(self.url(path)).bearer_auth(&self.config.token).json(body).send())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn config_file_and_environment() {
        let file = "# Apollo server\nurl = http://localhost:8001/apollo/v1/server/\ntoken = \"abc\" # secret\n";
        let config = Config::from_sources(file, None, None);
        assert_eq!(config.url, "http://localhost:8001/apollo/v1/server");
        assert_eq!(config.token, "abc");
        let config = Config::from_sources(file, None, Some("xyz".into()));
        assert_eq!(config.token, "xyz");
        assert_eq!(Config::from_sources("", None, None).url, DEFAULT_URL);
    }
}
