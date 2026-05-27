import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/auth/forgot_password_page/forgot_password_page.dart';
import 'package:presentation/pages/auth/register_page/register_page.dart';

import '../../pages/auth/login_page/login_page.dart';
import '../../pages/main_page/main_navigation_bar_widget.dart';
import '../widgets/session_expired_dialog.dart';

class AppRouter {
  static NavigatorState? get _nav => Get.context != null ? Navigator.of(Get.context!, rootNavigator: true) : null;

  static Future<T?> _push<T>(Widget page) {
    if (_nav == null) return Future.value();
    return _nav!.push<T>(CupertinoPageRoute(builder: (_) => page));
  }

  static Future<T?> _pushAndRemoveAll<T>(Widget page) {
    if (_nav == null) return Future.value();
    return _nav!.pushAndRemoveUntil<T>(CupertinoPageRoute(builder: (_) => page), (route) => false);
  }

  static void pop<T>([T? result]) {
    _nav?.pop(result);
  }

  // ================= ROUTES =================

  static Future<void> goToLoginPage({bool clearStack = true}) {
    return clearStack ? _pushAndRemoveAll(const LoginPage()) : _push(const LoginPage());
  }

  static Future<void> goToHomePage({bool clearStack = true}) {
    return clearStack ? _pushAndRemoveAll(const MainNavigationPage()) : _push(const MainNavigationPage());
  }

  static Future<void> goToResetPasswordPage() {
    return _push(const ForgotPasswordPage());
  }

  static Future<void> goToRegisterPage() {
    return _push(const RegisterPage());
  }

  // In AppRouter
  static Future<bool> showBaseDialog({
    required BuildContext context,
    required bool barrierDismissible,
    required Widget dialog,
  }) async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.black.withAlpha(100),
      builder: (context) => dialog,
    ) ?? false;
  }

  static Future<bool> showSessionExpiredDialog({
    required BuildContext context,
  }) async {
    return showBaseDialog(
      context: context,
      barrierDismissible: false,
      dialog: const SessionExpiredDialog(),
    );
  }
}
