# Timely data layer

Data owns Retrofit services, repository implementations, ObjectBox token and
feature caches, plus a small local API used to exercise token refresh.

## Session endpoints

Current Retrofit services call:

- `POST /login/`
- `POST /refresh/`
- `GET /profile/`

Token JSON uses `access_token` and `refresh_token`.

## Local refresh test API

Start from `data`:

```sh
dart run lib/tool/local_api.dart
```

Server listens on `0.0.0.0:8080`. Run Timely from `presentation`:

```sh
# iOS Simulator
flutter run --dart-define=API_BASE_URL=http://127.0.0.1:8080

# Android emulator
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8080

# Physical device: replace with Mac LAN address
flutter run --dart-define=API_BASE_URL=http://192.168.88.25:8080
```

Any login credentials work. Login returns an expired access token and valid
refresh token. First `/profile/` request returns 401, `/refresh/` rotates both
tokens, and profile retry returns 200.

Force profile and schedule endpoints to keep returning 401 after refresh:

```sh
curl -X POST http://127.0.0.1:8080/force-session-expired
```

Expected result: one refresh, one retry, tokens cleared, one session-expired
dialog.

Restore normal behavior:

```sh
curl -X POST http://127.0.0.1:8080/reset
```

`GET /always-401` is available for direct retry-loop tests.

## Token storage rule

ObjectBox writes must be awaited. The interceptor reads stored tokens
immediately after refresh; an unawaited `putAsync` can make retry use the old
access token.
