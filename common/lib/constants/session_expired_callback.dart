import 'logger.dart';

class SessionExpiredCallback {
  void Function()? callback;

  void call() {
    callback?.call();
    consoleLog('session Expired called with value');
  }
}
