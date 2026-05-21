import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/auth/login_page/login_controller.dart';
import 'package:presentation/util/base/base_page.dart';
import 'package:presentation/util/widgets/text_form_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController get controller => Get.find();

  @override
  void initState() {
    super.initState();
    Get.put(LoginController());
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      pendingIds: [],
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: .all(16.w),
            child: Column(
              children: [
                TextFormFieldWidget(item: controller.emailViewItem.value),
                16.verticalSpace,
                TextFormFieldWidget(item: controller.passwordViewItem.value),
              ],
            ),
          ),
        );
      },
    );
  }
}
