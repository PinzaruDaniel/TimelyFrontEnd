import 'package:common/constants/app_constants.dart';
import 'package:domain/modules/auth/use_cases/auth_login_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../../../controllers/controller_imports.dart';

class LoginController extends GetxController {
  final AuthLoginUseCase _authLoginUseCase = GetIt.instance<AuthLoginUseCase>();

  Rx<TextEditingController> emailController = .new(TextEditingController());
  Rx<TextEditingController> passwordController = .new(TextEditingController());

  final RegExp _emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) {
      return 'Email is required.';
    }
    if (!_emailRegex.hasMatch(email)) {
      return 'Invalid email format.';
    }
    return null;
  }

  String? validatePassword(String? value) {
    final password = value ?? '';
    if (password.isEmpty) {
      return 'Password is required.';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters.';
    }
    return null;
  }

  Future<void> login({
    required BuildContext context,
    VoidCallback? onSuccess,
  }) async {
    final isValid = loginFormKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    final email = emailController.value.text.trim();
    final password = passwordController.value.text.trim();

    mainAppController.addPendingIds([AppConstants.login]);
    final result = await _authLoginUseCase(
      AuthLoginParams(email: email, password: password),
    );
    result.fold(
      onFailure: (failure) =>
          _showSnack(context, failure.message ?? 'Login failed'),
      onSuccess: (_) => onSuccess?.call(),
    );
    mainAppController.removePendingIds([AppConstants.login]);
  }

  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }
}
