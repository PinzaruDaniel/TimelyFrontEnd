import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:presentation/util/routing/app_router.dart';

import '../../../controllers/controller_imports.dart';
import '../../../util/base/base_app_bar_widget.dart';
import '../../../util/base/base_app_dialog.dart';
import '../../../util/resources/app_colors.dart';
import '../../../util/resources/texts_styles.dart';
import '../../../util/widgets/button_widget.dart';
import '../../../util/widgets/main_circular_progress_indicator_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBarWidget(title: 'Profile', showBackIcon: false),
      body: Obx(() {
        final user = userProfileController.userViewModel.value;
        if (user == null) {
          return const Center(child: MainCircularProgressIndicatorWidget());
        }
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar + name card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(gradient: AppColors.deepTeal, borderRadius: BorderRadius.circular(20.r)),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30.r,
                      backgroundColor: Colors.white.withAlpha(50),
                      child: Text(
                        user.fullName.isNotEmpty ? user.fullName[0].toUpperCase() : '?',
                        style: TextsStyles.h2.copyWith(color: Colors.white),
                      ),
                    ),
                    16.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.fullName,
                            style: TextsStyles.titleMedium.copyWith(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                          4.verticalSpace,
                          Text(
                            user.email,
                            style: TextsStyles.bodySmall.copyWith(color: Colors.white70),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              24.verticalSpace,

              // Info section
              Text('Account Info', style: TextsStyles.titleSmall),
              12.verticalSpace,
              _InfoTile(icon: Icons.person_outline_rounded, label: 'Full Name', value: user.fullName),
              _InfoTile(icon: Icons.email_outlined, label: 'Email', value: user.email),
              _InfoTile(icon: Icons.group_outlined, label: 'Group', value: user.groupName, isLast: true),
              32.verticalSpace,

              // Logout button
              ButtonWidget(
                onTap: () async {
                  final confirmed = await AppRouter.showBaseDialog(
                    context: context,
                    barrierDismissible: true,
                    dialog: BaseAppDialog(
                      title: 'Log Out',
                      titleIcon: Icons.logout_rounded,
                      confirmLabel: 'Log Out',
                      cancelLabel: 'Cancel',
                      content: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Text('Are you sure you want to log out?', style: TextsStyles.bodyMedium),
                      ),
                      onConfirm: () {
                        Navigator.of(context).pop(true);
                      },
                    ),
                  );
                  if (confirmed) {
                    userProfileController.deleteAll();
                    AppRouter.goToLoginPage();
                  }
                },
                title: 'Log Out',
                background: AppColors.error.withAlpha(15),
                borderColor: AppColors.error.withAlpha(80),
                textStyle: TextsStyles.titleSmall.copyWith(color: AppColors.error),
              ),
              16.verticalSpace,
            ],
          ),
        );
      }),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isLast;

  const _InfoTile({required this.icon, required this.label, required this.value, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: isLast ? BorderSide.none : BorderSide(color: AppColors.divider)),
      ),
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryCian, size: 20.r),
          12.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextsStyles.caption),
              4.verticalSpace,
              Text(value, style: TextsStyles.bodyMedium),
            ],
          ),
        ],
      ),
    );
  }
}
