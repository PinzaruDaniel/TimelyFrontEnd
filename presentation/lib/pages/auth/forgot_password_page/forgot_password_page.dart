import 'package:common/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/auth/forgot_password_page/forgot_password_controller.dart';
import 'package:presentation/util/base/base_app_bar_widget.dart';
import 'package:presentation/util/base/base_page.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/widgets/text_form_field_widget.dart';

import '../../../util/resources/texts_styles.dart';
import '../../../util/routing/app_router.dart';
import '../../../util/widgets/button_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  ForgotPasswordController get controller => Get.find();

  @override
  void initState() {
    super.initState();
    Get.put(ForgotPasswordController());
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: const BaseAppBarWidget(title: 'ForgotPassword',),
      pendingIds: [AppConstants.forgotPassword],
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: .all(16.w),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Form(
                  key: controller.forgotPasswordFormKey,
                  child: AutofillGroup(
                    child: Column(
                      crossAxisAlignment: .start,
                      mainAxisSize: .min,
                      children: [
                        Text('Email', style: TextsStyles.titleSmall.copyWith(fontSize: 14.sp)),
                        TextFormFieldWidget(
                          item: TextFieldViewItem(
                            controller: controller.emailController.value,
                            hintText: 'user@example.com',
                            validator: controller.validateEmail,
                          ),
                        ),
                        16.verticalSpace,
                        Text('New password', style: TextsStyles.titleSmall.copyWith(fontSize: 14.sp)),
                        TextFormFieldWidget(
                          item: TextFieldViewItem(
                            controller: controller.passwordController.value,
                            hintText: '********',
                            isPassword: true,
                            validator: controller.validatePassword,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                36.verticalSpace,
                ButtonWidget(
                  onTap: () {
                    TextInput.finishAutofillContext();
                    controller.resetPassword(
                      context: context,
                      onSuccess: () => AppRouter.goToLoginPage(clearStack: true),
                    );
                  },
                  title: 'Reset password',
                  textStyle: TextsStyles.titleSmall.copyWith(fontSize: 14.sp, color: Colors.white),
                  linearGradient: LinearGradient(colors: [AppColors.primaryCian, AppColors.primaryBlue]),
                  boxShadow: BoxShadow(color: AppColors.primaryCian.withAlpha(100), blurRadius: 6, spreadRadius: 2),
                ),
                16.verticalSpace,
                ButtonWidget(
                  onTap: () => AppRouter.goToLoginPage(clearStack: true),
                  title: 'Back to login',
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
