# Timely presentation

Flutter UI, GetX controllers, routing, and session-expired dialog for Timely.

## Session API

Login, refresh, and profile use the
[session_api](https://github.com/PinzaruDaniel/session_api) service. Default API
URL is `http://127.0.0.1:8000`.

Override the URL when the API runs on another host:

```bash
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8000
```

`10.0.2.2` connects an Android emulator to the development machine. Use the
machine's LAN address for a physical device.

Session UI is initialized before DI:

```dart
await RefreshInit.instance.initialize(
  sessionExpiredWidget: const SessionExpiredDialog(),
);
await initDI(get: GetIt.instance);
```

See [`../docs/auth-session.md`](../docs/auth-session.md) for full behavior and
test scenarios.

## Chat Media

The chat page supports image and video messages. Select a chat, then use the image or video button to upload media to Firebase Storage and send a message with the media URL.

## Verify

```sh
flutter analyze lib/main.dart
```
