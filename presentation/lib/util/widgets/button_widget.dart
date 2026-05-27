import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/texts_styles.dart';

class ButtonWidget extends StatelessWidget {
  final Function onTap;
  final BoxShadow? boxShadow;
  final LinearGradient? linearGradient;
  final Color? background;
  final String title;
  final Color? borderColor;
  final TextStyle? textStyle;

  const ButtonWidget({
    super.key,
    required this.onTap,
    this.boxShadow,
    this.linearGradient,
    this.background,
    required this.title,
    this.textStyle,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap.call(),
      borderRadius: .circular(25.r),

      child: Ink(
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [?boxShadow],
          borderRadius: .circular(25.r),
          border: borderColor != null ? .all(color: borderColor!) : null,
          gradient: linearGradient,
          color: background,
        ),
        child: Padding(
          padding: .all(16.w),
          child: Text(title, textAlign: .center, style: textStyle ?? TextsStyles.bodyMedium),
        ),
      ),
    );
  }
}
