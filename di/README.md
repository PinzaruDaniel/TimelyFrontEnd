# Timely dependency injection

Dependencies are declared in Injectable modules:

- `lib/modules/data_module.dart` — ObjectBox, Dio, refresh interceptor,
  data sources, and repositories.
- `lib/modules/domain_module.dart` — domain use cases.

Generated GetIt registrations live in `lib/injector.config.dart`.

After changing either module, regenerate configuration:

```sh
dart run build_runner build
```

Application bootstrap only calls:

```dart
await initDi(onSessionExpired: onSessionExpired);
```

ObjectBox is pre-resolved before `initDi` completes. Other dependencies remain
lazy singletons. `authDio` never receives the refresh interceptor; `appDio`
does.
