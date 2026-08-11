# timely_front_end

A new Flutter project.

## Session API

The login, token refresh, and protected Home request use the
[session_api](https://github.com/PinzaruDaniel/session_api) service. The default
API URL is `http://127.0.0.1:8000`, and the demo credentials are
`user@example.com` / `password123`.

Override the URL when the API runs on another host:

```bash
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8000
```

`10.0.2.2` connects an Android emulator to the development machine. Use the
machine's LAN address for a physical device.

## Chat Media

The chat page supports image and video messages. Select a chat, then use the image or video button to upload media to Firebase Storage and send a message with the media URL.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
