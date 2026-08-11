# Authentication and session refresh

## Startup

```dart
WidgetsFlutterBinding.ensureInitialized();

await RefreshInit.instance.initialize(
  sessionExpiredWidget: const SessionExpiredDialog(),
);
await initDI(get: GetIt.instance);
```

`GetMaterialApp` must use `RefreshInit.instance.navigatorKey`.

Before requesting profile, startup checks ObjectBox for an access token. An
anonymous first launch goes directly to LoginPage without calling a protected
endpoint or showing session-expired UI.

## Dio separation

- `authDio`: `/login/` and `/refresh/`; no refresh interceptor.
- `appDio`: `/profile/` and other protected endpoints; shared interceptor.

Attaching the interceptor to `authDio` can cause refresh recursion.

## Token flow

1. Login stores `access_token` and `refresh_token` in ObjectBox.
2. Protected requests receive `Authorization: Bearer <access token>`.
3. A 401/403 starts or joins one refresh operation.
4. `/refresh/` receives `{"refresh_token":"..."}`.
5. New tokens are awaited in ObjectBox.
6. Original request retries once.
7. Refresh 401/403 or retry 401/403 clears tokens and shows one dialog.
8. Timeout, connection failure, or 5xx preserves tokens as transient failure.

## API contract

| Method | Path | Purpose |
| --- | --- | --- |
| POST | `/login/` | Exchange email/password for tokens. |
| POST | `/refresh/` | Exchange refresh token for new tokens. |
| GET | `/profile/` | Validate bearer access token and load user. |

Responses use `access_token` and `refresh_token`. A profile access-token expiry
and refresh-token rejection must use 401/403. A 404 is not an auth signal.

## Device addresses

| Flutter target | Development-machine host |
| --- | --- |
| iOS Simulator | `127.0.0.1` |
| Android emulator | `10.0.2.2` |
| Physical device | Mac LAN address |

Example physical-device run:

```sh
flutter run \
  --dart-define=API_BASE_URL=http://192.168.88.25:8000
```

Server must bind `0.0.0.0`; Mac and phone must share a network.

## Test matrix

| Scenario | Expected |
| --- | --- |
| No stored tokens | LoginPage, no profile request, no expiry dialog. |
| Expired access + valid refresh | One refresh, token save, one successful retry. |
| Expired access + invalid refresh | Tokens cleared, one expiry dialog. |
| Concurrent protected 401s | One refresh HTTP request shared by callers. |
| Refresh timeout/5xx | Tokens preserved, original error returned. |
| Retried request remains 401 | No second refresh; session expires. |

## Local deterministic harness

```sh
cd data
dart run lib/tool/local_api.dart
```

Normal mode:

```sh
curl -X POST http://127.0.0.1:8080/reset
```

Forced permanent expiry:

```sh
curl -X POST http://127.0.0.1:8080/force-session-expired
```

## Troubleshooting

| Symptom | Resolution |
| --- | --- |
| Physical device connection refused | Replace `127.0.0.1` with Mac LAN IP. |
| Retry sends old access token | Await every ObjectBox write. |
| Refresh 401 does not show dialog | Use package 0.2.1 and match 401/403 in `shouldRefresh`. |
| Dialog appears on first launch | Skip profile when token is absent; do not enable `expireSessionOnMissingToken`. |
| Duplicate LoginPage form key | Keep LoginController/form key local to each page instance. |
| Endless refresh requests | Ensure `authDio` has no refresh interceptor. |
