// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_repository_impl.dart';

// **************************************************************************
// SmartRepositoryFamilyGenerator
// **************************************************************************

/// Generated keyed repository delegate for `ScheduleRepositoryImpl`.
mixin _$ScheduleRepositoryImpl {
  /// Loads remote model for [key].
  Future<ScheduleApiDto> smartLoadRemote(String key);

  /// Loads local model for [key], or null when no cached value exists.
  Future<ScheduleBox?> smartLoadLocal(String key);

  /// Persists mapped local [value] for [key].
  Future<void> smartSaveLocal(String key, ScheduleBox value);

  /// Maps remote model into domain entity.
  ScheduleEntity smartMapRemote(ScheduleApiDto value);

  /// Maps local model into domain entity.
  ScheduleEntity smartMapLocal(ScheduleBox value);

  /// Maps domain entity into local persistence model.
  ScheduleBox smartMapToLocal(ScheduleEntity value);

  /// Whether remote [error] for [key] may fall back to local data.
  bool smartFallbackWhen(String key, Object error) => true;

  /// Configuration shared by repositories created for each key.
  SmartRepositoryConfig get smartRepositoryConfig =>
      const SmartRepositoryConfig(defaultPolicy: RepositoryPolicy.networkFirst);

  late final MappedRepositoryFamily<
    String,
    ScheduleEntity,
    ScheduleApiDto,
    ScheduleBox
  >
  _smartRepository =
      MappedRepositoryFamily<
        String,
        ScheduleEntity,
        ScheduleApiDto,
        ScheduleBox
      >(
        remote: smartLoadRemote,
        local: smartLoadLocal,
        saveLocal: smartSaveLocal,
        mapRemote: smartMapRemote,
        mapLocal: smartMapLocal,
        mapToLocal: smartMapToLocal,
        fallbackWhen: smartFallbackWhen,
        config: smartRepositoryConfig,
      );

  /// Underlying domain-typed repository family.
  SmartRepositoryFamily<String, ScheduleEntity> get smartRepositoryCore =>
      _smartRepository.core;

  /// Reads [key] using generated repository delegate.
  Future<RepositoryResult<ScheduleEntity>> smartGet(
    String key, {
    RepositoryPolicy? policy,
    bool? persistRemote,
    Duration? maxAge,
  }) => _smartRepository.get(
    key,
    policy: policy,
    persistRemote: persistRemote,
    maxAge: maxAge,
  );

  /// Refreshes [key], optionally bypassing request deduplication.
  Future<RepositoryResult<ScheduleEntity>> smartRefresh(
    String key, {
    bool force = false,
  }) => _smartRepository.refresh(key, force: force);

  /// Persists [value] for [key] and publishes local state.
  Future<RepositoryResult<ScheduleEntity>> smartSetLocal(
    String key,
    ScheduleEntity value,
  ) => _smartRepository.setLocal(key, value);

  /// Watches repository state for [key].
  Stream<RepositoryState<ScheduleEntity>> smartWatch(String key) =>
      _smartRepository.watch(key);

  /// Marks [key] stale.
  void smartInvalidate(String key) => _smartRepository.invalidate(key);

  /// Marks every created key stale.
  void smartInvalidateAll() => _smartRepository.invalidateAll();

  /// Deletes local data for [key] and resets its state.
  Future<void> smartClear(String key) => _smartRepository.clear(key);

  /// Disposes and forgets [key] without deleting persistent data.
  Future<bool> smartRemove(String key) => _smartRepository.remove(key);

  /// Releases every generated repository resource.
  Future<void> disposeSmartRepository() => _smartRepository.dispose();
}
