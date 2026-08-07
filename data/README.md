# Timely data layer

## Local refresh-interceptor test

Start local API:

```sh
cd data
dart run lib/tool/local_api.dart
```

Run Flutter app in another terminal:

```sh
cd presentation
flutter run --dart-define=API_BASE_URL=http://127.0.0.1:8080
```

Android emulator uses host alias:

```sh
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8080
```

Log in with any credentials. Local login returns `expired-access`. First
`/api/User/me` call returns 401, refresh returns rotated tokens, then original
profile request retries and returns 200.

`GET /always-401` verifies retry-loop protection: one refresh, one retry, final
401, one session-expired callback.

To force the app's existing `/api/User/me` request to expire the session even
after a successful refresh:

```sh
curl -X POST http://127.0.0.1:8080/force-session-expired
```

Restore normal behavior:

```sh
curl -X POST http://127.0.0.1:8080/reset
```
