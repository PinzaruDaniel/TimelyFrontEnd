import 'logger.dart';

class SessionExpiredCallback {
  final Function() onSessionExpired;

  SessionExpiredCallback({required this.onSessionExpired});

  void call() {
    onSessionExpired.call();
    consoleLog('session Expired called with value');
  }
}
