import 'package:get_it/get_it.dart';

import 'injector.dart';

export 'injector.dart' show getIt;

Future<void> initDI({required GetIt get}) async {
  await configureDependencies(get: get);
}

Future<void> initDi({GetIt? get}) => initDI(get: get ?? GetIt.instance);
