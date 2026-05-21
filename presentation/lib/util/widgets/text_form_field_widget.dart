import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_colors.dart';

class TextFieldViewItem {
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final List<String>? autofillHints;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final bool isPassword;
  final TextEditingController? controller;

  const TextFieldViewItem({
    this.controller,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.autofillHints,
    this.prefixIcon,
    this.validator,
    this.isPassword = false,
  });
}

class TextFormFieldWidget extends StatefulWidget {
  final TextFieldViewItem item;

  const TextFormFieldWidget({super.key, required this.item});

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool isObscure = false;
  TextEditingController editingController = .new();

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    return TextFormField(
      controller: editingController,
      keyboardType: item.keyboardType,
      autofillHints: item.autofillHints,
      obscureText: item.isPassword ? isObscure : false,
      validator: item.validator,
      decoration: InputDecoration(
        prefixIcon: item.prefixIcon,
        suffixIcon: item.isPassword
            ? IconButton(
                color: AppColors.hintColor,
                onPressed: () {
                  setState(() => isObscure = !isObscure);
                },
                icon: Icon(
                  isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  color: AppColors.hintColor,
                  size: 20.w,
                ),
              )
            : null,
        hintText: item.hintText,
        labelText: item.labelText,
        isDense: true,
        hintStyle: const TextStyle(color: AppColors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(color: AppColors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(color: AppColors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide(color: AppColors.primaryCian, width: 2.w),
        ),
      ),
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
