import 'package:common/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/auth/register_page/register_controller.dart';
import 'package:presentation/util/base/base_app_bar_widget.dart';
import 'package:presentation/util/base/base_page.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/widgets/text_form_field_widget.dart';

import '../../../util/resources/texts_styles.dart';
import '../../../util/routing/app_router.dart';
import '../../../util/widgets/button_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterController get controller => Get.find();

  static const List<String> _groups = [
    'PTPP-251',
    'DAW-251',
    'RC-251',
    'C-251',
    'TRT-251',
    'DTTA-251',
    'TA-251',
    'TAP-251',
    'MSP-251',
    'UTIA-251',
    'TPM-251',
    'PTPP-241',
    'DAW-241',
    'RC-241',
    'C-241',
    'TRT-241',
    'DTTA-241',
    'TA-241',
    'TAP-241',
    'MSP-241',
    'UTIA-241',
    'TPM-241',
    'PAPP-231',
    'AAW-231',
    'RC-231',
    'C-231',
    'TRT-231',
    'DTTA-231',
    'TA-231',
    'TAP-231',
    'MSP-231',
    'UTIA-231',
    'TPM-231',
    'PAPP-221',
    'AAW-221',
    'RC-221',
    'C-221',
    'TRT-221',
    'DTTA-221',
    'TA-221',
    'TAP-221',
    'MSP-221',
    'UTIA-221',
    'TPM-221',
  ];

  Future<void> _selectGroup(BuildContext context) async {
    final currentIndex = controller.groupController.value.text.isEmpty
        ? 0
        : _groups.indexOf(controller.groupController.value.text).clamp(0, _groups.length - 1);
    int selectedIndex = currentIndex;

    final selected = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return SafeArea(
          child: SizedBox(
            height: 250.h,
            child: Column(
              children: [
                Padding(
                  padding: .symmetric(horizontal: 16.w, vertical: 4.h),
                  child: Row(
                    mainAxisAlignment: .end,
                    children: [
                      CupertinoButton(
                        padding: .zero,
                        onPressed: () => Navigator.of(context).pop(_groups[selectedIndex]),
                        child: Text('Done', style: TextsStyles.titleSmall.copyWith(color: AppColors.primaryCian)),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                Expanded(
                  child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(initialItem: currentIndex),
                    itemExtent: 30.h,
                    magnification: 1.2,
                    onSelectedItemChanged: (index) {
                      selectedIndex = index;
                    },
                    children: _groups.map((group) => Center(child: Text(group, style: TextsStyles.titleMedium,))).toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    if (selected != null) {
      setState(() {
        controller.groupController.value.text = selected;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Get.put(RegisterController());
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: const BaseAppBarWidget(),
      pendingIds: [AppConstants.register],
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: .all(16.w),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Form(
                  key: controller.registerFormKey,
                  child: AutofillGroup(
                    child: Column(
                      crossAxisAlignment: .start,
                      mainAxisSize: .min,
                      children: [
                        Text('Name', style: TextsStyles.titleSmall.copyWith(fontSize: 14.sp)),
                        TextFormFieldWidget(
                          item: TextFieldViewItem(
                            controller: controller.nameController.value,
                            hintText: 'John Doe',
                            validator: controller.validateName,
                          ),
                        ),
                        16.verticalSpace,
                        Text('Email', style: TextsStyles.titleSmall.copyWith(fontSize: 14.sp)),
                        TextFormFieldWidget(
                          item: TextFieldViewItem(
                            controller: controller.emailController.value,
                            hintText: 'user@example.com',
                            validator: controller.validateEmail,
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
                          ),
                        ),
                        16.verticalSpace,
                        Text('Group', style: TextsStyles.titleSmall.copyWith(fontSize: 14.sp)),
                        GestureDetector(
                          onTap: () => _selectGroup(context),
                          child: AbsorbPointer(
                            child: TextFormField(
                              controller: controller.groupController.value,
                              validator: controller.validateGroup,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'Select group',
                                hintStyle: TextsStyles.hint,
                                suffixIcon: const Icon(Icons.keyboard_arrow_up_rounded, color: AppColors.hintColor),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: const BorderSide(color: AppColors.borderColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: const BorderSide(color: AppColors.borderColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.r),
                                  borderSide: BorderSide(color: AppColors.primaryCian, width: 2.w),
                                ),
                              ),
                            ),
                          ),
                        ),
                        16.verticalSpace,
                      ],
                    ),
                  ),
                ),
                36.verticalSpace,
                ButtonWidget(
                  onTap: () {
                    TextInput.finishAutofillContext();
                    controller.register(
                      context: context,
                      onSuccess: () => AppRouter.goToHomePage(clearStack: true),
                    );
                  },
                  title: 'Create account',
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
