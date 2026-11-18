//! Talking to Minotaur's Apollo API (`/apollo/v1/server/...`).

use std::time::Duration;

use reqwest::blocking::Client;
use serde_json::Value;

/// The websites (overridden by `APOLLO_URL` and `APOLLO_DEBUG_URL`): the live one, and the
/// development one for test servers (`APOLLO_SERVER_DEBUG`). The same variables as apollo-client.
pub const LIVE_WEBSITE: &str = "https://www.theseus-aegis.com";
pub const DEV_WEBSITE: &str = "https://srv.theseus-aegis.com/minotaur";
/// Minotaur's Apollo API for game servers, on that website.
pub const API_PATH: &str = "/apollo/v1/server";
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
    /// From the environment (the server runs in Docker):
    /// - `APOLLO_SERVER_TOKEN`: from the website's admin (Chronos · Apollo › Game servers);
    /// - `APOLLO_SERVER_DEBUG` (`1`, `true` or `yes`): a test server, using the development website;
    /// - `APOLLO_URL` / `APOLLO_DEBUG_URL`: the live / development website, if not the usual ones
    ///   (e.g. `http://minotaur:8000` on the same Docker network).
    pub fn load() -> Self {
        Self::from_env(|key| std::env::var(key).ok())
    }

    pub fn from_env(var: impl Fn(&str) -> Option<String>) -> Self {
        let debug = var("APOLLO_SERVER_DEBUG").is_some_and(|v| is_true(&v));
        Self {
            url: format!("{}{API_PATH}", website(&var, debug)),
            token: var("APOLLO_SERVER_TOKEN").unwrap_or_default().trim().to_string(),
        }
    }
}

fn is_true(value: &str) -> bool {
    matches!(value.trim().to_lowercase().as_str(), "1" | "true" | "yes")
}

/// The live or (`debug`) development website, without a trailing slash.
fn website(var: &impl Fn(&str) -> Option<String>, debug: bool) -> String {
    let (key, default) = if debug { ("APOLLO_DEBUG_URL", DEV_WEBSITE) } else { ("APOLLO_URL", LIVE_WEBSITE) };
    var(key).map(|v| v.trim().to_string()).filter(|v| !v.is_empty()).unwrap_or_else(|| default.to_string())
        .trim_end_matches('/').to_string()
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

    fn config(vars: &[(&str, &str)]) -> Config {
        let vars: Vec<(String, String)> = vars.iter().map(|(k, v)| (k.to_string(), v.to_string())).collect();
        Config::from_env(|key| vars.iter().find(|(k, _)| k == key).map(|(_, v)| v.clone()))
    }

    #[test]
    fn live_by_default() {
        let c = config(&[("APOLLO_SERVER_TOKEN", " abc\n")]);
        assert_eq!(c.url, "https://www.theseus-aegis.com/apollo/v1/server");
        assert_eq!(c.token, "abc");
        assert_eq!(config(&[]).token, "");
    }

    #[test]
    fn debug_picks_the_development_website() {
        assert_eq!(config(&[("APOLLO_SERVER_DEBUG", "true")]).url, "https://srv.theseus-aegis.com/minotaur/apollo/v1/server");
        assert_eq!(config(&[("APOLLO_SERVER_DEBUG", "1")]).url, format!("{DEV_WEBSITE}{API_PATH}"));
        assert_eq!(config(&[("APOLLO_SERVER_DEBUG", "0")]).url, format!("{LIVE_WEBSITE}{API_PATH}"));
        assert_eq!(config(&[("APOLLO_SERVER_DEBUG", "")]).url, format!("{LIVE_WEBSITE}{API_PATH}"));
    }

    #[test]
    fn websites_overridden() {
        let vars = [("APOLLO_URL", "https://example.com/"), ("APOLLO_DEBUG_URL", "http://minotaur:8000")];
        assert_eq!(config(&vars).url, "https://example.com/apollo/v1/server");
        let debug = [vars[0], vars[1], ("APOLLO_SERVER_DEBUG", "yes")];
        assert_eq!(config(&debug).url, "http://minotaur:8000/apollo/v1/server");
        assert_eq!(config(&[("APOLLO_URL", " ")]).url, format!("{LIVE_WEBSITE}{API_PATH}")); // empty: the usual one
    }
}
