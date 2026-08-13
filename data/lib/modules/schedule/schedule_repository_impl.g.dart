// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_repository_impl.dart';

// **************************************************************************
// SmartRepositoryFamilyGenerator
// **************************************************************************

mixin _$ScheduleRepositoryImpl {
  Future<ScheduleApiDto> smartLoadRemote(String key);
  Future<ScheduleBox?> smartLoadLocal(String key);
  Future<void> smartSaveLocal(String key, ScheduleBox value);

  ScheduleEntity smartMapRemote(ScheduleApiDto value);
  ScheduleEntity smartMapLocal(ScheduleBox value);
  ScheduleBox smartMapToLocal(ScheduleEntity value);

  bool smartFallbackWhen(String key, Object error) => true;

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

  SmartRepositoryFamily<String, ScheduleEntity> get smartRepositoryCore =>
      _smartRepository.core;

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

  Future<RepositoryResult<ScheduleEntity>> smartRefresh(
    String key, {
    bool force = false,
  }) => _smartRepository.refresh(key, force: force);

  Future<RepositoryResult<ScheduleEntity>> smartSetLocal(
    String key,
    ScheduleEntity value,
  ) => _smartRepository.setLocal(key, value);

  Stream<RepositoryState<ScheduleEntity>> smartWatch(String key) =>
      _smartRepository.watch(key);
  void smartInvalidate(String key) => _smartRepository.invalidate(key);
  void smartInvalidateAll() => _smartRepository.invalidateAll();
  Future<void> smartClear(String key) => _smartRepository.clear(key);
  Future<bool> smartRemove(String key) => _smartRepository.remove(key);
  Future<void> disposeSmartRepository() => _smartRepository.dispose();
}
