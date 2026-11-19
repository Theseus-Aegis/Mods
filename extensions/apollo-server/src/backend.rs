//! Talking to Minotaur's Apollo API (`/apollo/v1/server/...`).

use std::time::Duration;

use reqwest::blocking::Client;
use serde_json::Value;

/// The websites (overridden by `APOLLO_LIVE_URL` and `APOLLO_DEV_URL`): the live one, only for the
/// live server (`APOLLO_SERVER_LIVE`), and the development one for every other server, a local one
/// included. The same variables as apollo-client.
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
    /// Uses the live website (told to players' apollo-client by `getApi`).
    pub live: bool,
    pub url: String,
    pub token: String,
}

impl Config {
    /// From the environment (the server runs in Docker):
    /// - `APOLLO_SERVER_TOKEN`: from the website's admin (Chronos · Apollo › Game servers);
    /// - `APOLLO_SERVER_LIVE` (`1`, `true` or `yes`): the live server, using the live website;
    ///   without it, the development website;
    /// - `APOLLO_LIVE_URL` / `APOLLO_DEV_URL`: the live / development website, if not the usual
    ///   ones (e.g. `http://minotaur:8000` on the same Docker network).
    pub fn load() -> Self {
        Self::from_env(|key| std::env::var(key).ok())
    }

    pub fn from_env(var: impl Fn(&str) -> Option<String>) -> Self {
        let live = var("APOLLO_SERVER_LIVE").is_some_and(|v| is_true(&v));
        Self {
            live,
            url: format!("{}{API_PATH}", website(&var, live)),
            token: var("APOLLO_SERVER_TOKEN").unwrap_or_default().trim().to_string(),
        }
    }
}

fn is_true(value: &str) -> bool {
    matches!(value.trim().to_lowercase().as_str(), "1" | "true" | "yes")
}

/// The live (`live`) or development website, without a trailing slash.
fn website(var: &impl Fn(&str) -> Option<String>, live: bool) -> String {
    let (key, default) = if live { ("APOLLO_LIVE_URL", LIVE_WEBSITE) } else { ("APOLLO_DEV_URL", DEV_WEBSITE) };
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
    fn development_by_default() {
        let c = config(&[("APOLLO_SERVER_TOKEN", " abc\n")]);
        assert_eq!(c.url, "https://srv.theseus-aegis.com/minotaur/apollo/v1/server");
        assert!(!c.live);
        assert_eq!(c.token, "abc");
        assert_eq!(config(&[]).token, "");
    }

    #[test]
    fn live_picks_the_live_website() {
        let c = config(&[("APOLLO_SERVER_LIVE", "true")]);
        assert_eq!(c.url, "https://www.theseus-aegis.com/apollo/v1/server");
        assert!(c.live);
        assert_eq!(config(&[("APOLLO_SERVER_LIVE", "1")]).url, format!("{LIVE_WEBSITE}{API_PATH}"));
        assert_eq!(config(&[("APOLLO_SERVER_LIVE", "0")]).url, format!("{DEV_WEBSITE}{API_PATH}"));
        assert_eq!(config(&[("APOLLO_SERVER_LIVE", "")]).url, format!("{DEV_WEBSITE}{API_PATH}"));
    }

    #[test]
    fn websites_overridden() {
        let vars = [("APOLLO_LIVE_URL", "https://example.com/"), ("APOLLO_DEV_URL", "http://minotaur:8000")];
        assert_eq!(config(&vars).url, "http://minotaur:8000/apollo/v1/server");
        let live = [vars[0], vars[1], ("APOLLO_SERVER_LIVE", "yes")];
        assert_eq!(config(&live).url, "https://example.com/apollo/v1/server");
        assert_eq!(config(&[("APOLLO_DEV_URL", " ")]).url, format!("{DEV_WEBSITE}{API_PATH}")); // empty: the usual one
    }
}
