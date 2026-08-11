import 'package:common/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/pages/auth/login_page/login_controller.dart';
import 'package:presentation/util/base/base_page.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_icons.dart';
import 'package:presentation/util/widgets/text_form_field_widget.dart';

import '../../../util/resources/texts_styles.dart';
import '../../../util/routing/app_router.dart';
import '../../../util/widgets/button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController controller = LoginController();

  @override
  void dispose() {
    controller.onClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      resizeToAvoidBottomInset: true,
      pendingIds: [AppConstants.login],
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: .all(16.w),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Padding(
                  padding: .symmetric(horizontal: 40.w),
                  child: AppIcons.appIcon,
                ),
                Form(
                  key: controller.loginFormKey,
                  child: AutofillGroup(
                    child: Column(
                      crossAxisAlignment: .start,
                      mainAxisSize: .min,
                      children: [
                        Text('Email', style: TextsStyles.titleSmall.copyWith(fontSize: 14.sp)),
                        TextFormFieldWidget(
                          item: TextFieldViewItem(
                            controller: controller.emailController.value,
                            hintText: 'user@exmaple.com',
                            validator: controller.validateEmail,
                            keyboardType: TextInputType.emailAddress,
                            autofillHints: const [AutofillHints.email],
                          ),
                        ),
                        16.verticalSpace,
                        Text('Password', style: TextsStyles.titleSmall.copyWith(fontSize: 14.sp)),
                        TextFormFieldWidget(
                          item: TextFieldViewItem(
                            controller: controller.passwordController.value,
                            hintText: '********',
                            isPassword: true,
                            validator: controller.validatePassword,
                            autofillHints: const [AutofillHints.password],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                8.verticalSpace,
                Row(
                  mainAxisAlignment: .end,
                  children: [
                    InkWell(
                      onTap: () => AppRouter.goToResetPasswordPage(),
                      child: Text(
                        'Forgot password?',
                        style: TextsStyles.bodySmall.copyWith(fontSize: 14.sp, color: AppColors.primaryBlue),
                      ),
                    ),
                  ],
                ),
                36.verticalSpace,
                ButtonWidget(
                  onTap: () async {
                    TextInput.finishAutofillContext();
                    controller.passwordController.refresh();
                    controller.emailController.refresh();
                    await controller.login(
                      context: context,
                      onSuccess: () async {
                        await userProfileController.getUser();

                        AppRouter.goToHomePage(clearStack: true);
                      },
                    );
                  },
                  title: 'Login',
                  textStyle: TextsStyles.titleSmall.copyWith(fontSize: 14.sp, color: Colors.white),
                  linearGradient: LinearGradient(colors: [AppColors.primaryCian, AppColors.primaryBlue]),
                  boxShadow: BoxShadow(color: AppColors.primaryCian.withAlpha(100), blurRadius: 6, spreadRadius: 2),
                ),
                16.verticalSpace,
                ButtonWidget(
                  onTap: () => AppRouter.goToRegisterPage(),
                  title: 'Create account',
                  textStyle: TextsStyles.titleSmall.copyWith(fontSize: 14.sp, color: Colors.white),

                  borderColor: AppColors.borderColor,
                  background: AppColors.primaryCian,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
