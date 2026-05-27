// util/widgets/session_expired_dialog.dart
import 'package:flutter/material.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/util/routing/app_router.dart';

import '../base/base_app_dialog.dart';
import '../resources/app_colors.dart';

class SessionExpiredDialog extends StatelessWidget {
  const SessionExpiredDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseAppDialog(
      title: 'Session Expired',
      titleIcon: Icons.lock_outline_rounded,
      confirmLabel: 'Log In',
      cancelLabel: 'Cancel',
      onConfirm: () {
        userProfileController.deleteAll();
        AppRouter.goToLoginPage();
      },
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline_rounded, color: AppColors.primaryCian, size: 20),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Your session has expired. Please log in again to continue.',
                    style: TextStyle(fontSize: 14, color: Colors.black54, height: 1.4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
