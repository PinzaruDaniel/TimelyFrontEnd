import 'package:common/constants/session_expired_callback.dart';

import 'injector.dart';

export 'injector.dart' show getIt;

Future<void> initDi({required void Function() onSessionExpired}) async {
  await configureDependencies();
  getIt<SessionExpiredCallback>().callback = onSessionExpired;
}
