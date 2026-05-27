import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:presentation/util/resources/texts_styles.dart';

import '../resources/app_colors.dart';

class BaseAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackIcon;

  const BaseAppBarWidget({super.key, required this.title, this.showBackIcon = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: showBackIcon
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.primaryCian),
              onPressed: () => Get.back(),
            )
          : null,
      title: Text(title, style: TextsStyles.titleMedium),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
