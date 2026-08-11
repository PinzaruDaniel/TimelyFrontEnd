# Timely dependency injection

Injectable modules declare the application graph:

- `lib/modules/data_module.dart` — ObjectBox, auth/app Dio clients, refresh
  interceptor, data sources, repositories, Firebase.
- `lib/modules/domain_module.dart` — domain use cases.
- `lib/injector.config.dart` — generated GetIt registrations.

Initialize after `RefreshInit`:

```dart
await RefreshInit.instance.initialize(
  sessionExpiredWidget: const SessionExpiredDialog(),
);
await initDI(get: GetIt.instance);
```

`authDio` handles login and refresh and never receives the interceptor.
`appDio` handles protected endpoints and receives the single shared
`RefreshInterceptor`.

After editing a module, regenerate and verify:

```sh
dart run build_runner build
flutter analyze lib
```

ObjectBox is pre-resolved before `initDI` completes. Other dependencies are
lazy singletons.
