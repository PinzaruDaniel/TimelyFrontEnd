import 'package:flutter/material.dart';
import 'package:presentation/util/resources/texts_styles.dart';
import 'package:presentation/util/widgets/button_widget.dart';

import '../resources/app_colors.dart';

class BaseAppDialog extends StatelessWidget {
  final String title;
  final IconData titleIcon;
  final Widget content;
  final String cancelLabel;
  final String confirmLabel;
  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;

  const BaseAppDialog({
    super.key,
    required this.title,
    required this.titleIcon,
    required this.content,
    this.cancelLabel = 'Cancel',
    this.confirmLabel = 'Confirm',
    this.onCancel,
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Row(
              children: [
                Icon(titleIcon, color: AppColors.textPrimary, size: 20),
                const SizedBox(width: 10),
                Text(title, style: TextsStyles.titleLarge),
              ],
            ),
            const SizedBox(height: 20),
            // Content
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.80),
              child: SingleChildScrollView(child: content),
            ),
            const SizedBox(height: 24),
            // Buttons
            Flexible(
              child: Row(
                children: [
                  onCancel!= null?
                  Expanded(
                    child: Material(
                      child: ButtonWidget(
                        onTap: onCancel ?? () => Navigator.of(context).pop(false),
                        title: cancelLabel,
                        background: AppColors.borderColor,
                        textStyle: TextsStyles.titleMedium,
                      ),
                    ),
                  ): SizedBox.shrink(),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Material(
                      child: ButtonWidget(
                        onTap: onConfirm ?? () => Navigator.of(context).pop(true),
                        title: confirmLabel,
                        background: AppColors.primaryCian,
                        textStyle: TextsStyles.titleMedium.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
