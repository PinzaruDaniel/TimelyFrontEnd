# TimelyFrontEnd

Flutter client using clean package boundaries, Injectable/GetIt, ObjectBox,
Firebase, Dio, and `refresh_interceptor`.

## Packages

| Directory | Responsibility |
| --- | --- |
| `common` | Shared constants, failures, and Firebase configuration. |
| `domain` | Entities, repository contracts, and use cases. |
| `data` | Retrofit APIs, ObjectBox sources, repository implementations. |
| `di` | Injectable modules and generated GetIt graph. |
| `presentation` | Flutter UI, GetX controllers, routing, session dialog. |

## Authentication

Timely uses the Session API for `/login/`, `/refresh/`, and `/profile/`.
`refresh_interceptor` adds bearer tokens, performs a single shared refresh,
retries protected requests once, and presents Timely's session-expired widget
when refresh is permanently rejected.

Detailed docs:

- [`docs/auth-session.md`](docs/auth-session.md)
- [`data/README.md`](data/README.md)
- [`di/README.md`](di/README.md)

## Setup

Resolve each package after dependency changes:

```sh
cd di && flutter pub get
cd ../presentation && flutter pub get
```

Regenerate Injectable after DI module changes:

```sh
cd di
dart run build_runner build
```

## Run

Session API on development machine:

```sh
cd presentation
flutter run --dart-define=API_BASE_URL=http://127.0.0.1:8000
```

Use `10.0.2.2` for Android emulator. Use the Mac LAN address for physical
devices. See the auth/session guide for full device mapping and failure tests.

Local deterministic refresh harness:

```sh
cd data
dart run lib/tool/local_api.dart
```

Then run presentation with port `8080`.

## Verify

```sh
cd di && flutter analyze lib
cd ../presentation && flutter analyze lib/main.dart
```

The repository contains some placeholder test files without `main`; run valid
targeted tests until those placeholders are replaced.
