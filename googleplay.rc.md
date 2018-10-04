# Google play

## Client authorization

Authorize google client with `client_id`, `client_secret` and `redirect_uri`
via `refresh_token` <https://developers.google.com/android-publisher/authorization>

* get `client_id`, `client_secret` and `redirect_uri` credentials
  via oauth 2.0 client page
  <https://console.developers.google.com/apis/credentials>
* get `code` via GET request to
  <https://accounts.google.com/o/oauth2/auth?scope=https://www.googleapis.com/auth/androidpublisher&response_type=code&access_type=offline&redirect_uri=...&client_id=...>
* get `refresh_token` via POST request
  `curl --request POST --data "grant_type=authorization_code&code=...&client_id=...&client_secret=...&redirect_uri=..." "https://accounts.google.com/o/oauth2/token"`
