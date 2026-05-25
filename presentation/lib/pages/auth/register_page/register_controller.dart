import 'package:common/constants/app_constants.dart';
import 'package:domain/modules/auth/use_cases/auth_register_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../../../controllers/controller_imports.dart';

class RegisterController extends GetxController {
  final AuthRegisterUseCase _authRegisterUseCase = GetIt.instance<AuthRegisterUseCase>();

  Rx<TextEditingController> nameController = .new(TextEditingController());
  Rx<TextEditingController> emailController = .new(TextEditingController());
  Rx<TextEditingController> passwordController = .new(TextEditingController());
  Rx<TextEditingController> groupController = .new(TextEditingController());

  final RegExp _emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  String? validateName(String? value) {
    final name = value?.trim() ?? '';
    if (name.isEmpty) {
      return 'Name is required.';
    }
    return null;
  }

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

  String? validateGroup(String? value) {
    final group = value?.trim() ?? '';
    if (group.isEmpty) {
      return 'Group is required.';
    }
    return null;
  }

  Future<void> register({required BuildContext context, VoidCallback? onSuccess}) async {
    final isValid = registerFormKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    final name = nameController.value.text.trim();
    final email = emailController.value.text.trim();
    final password = passwordController.value.text.trim();
    final group = groupController.value.text.trim();

    mainAppController.addPendingIds([AppConstants.register]);
    final result = await _authRegisterUseCase(
      AuthRegisterParams(name: name, email: email, password: password, group: group),
    );
    result.fold((failure) => _showSnack(context, failure.message), (_) => onSuccess?.call());
    mainAppController.removePendingIds([AppConstants.register]);
  }

  @override
  void onClose() {
    nameController.value.dispose();
    emailController.value.dispose();
    passwordController.value.dispose();
    groupController.value.dispose();
    super.onClose();
  }

  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }
}