import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation/util/resources/texts_styles.dart';

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
  final FocusNode? focusNode;
  final int? minLines;
  final int? maxLines;

  const TextFieldViewItem({
    this.controller,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.autofillHints,
    this.prefixIcon,
    this.validator,
    this.isPassword = false,
    this.focusNode,
    this.minLines,
    this.maxLines = 1,
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
  late final TextEditingController editingController;
  bool _ownsController = false;

  @override
  void initState() {
    super.initState();
    _ownsController = widget.item.controller == null;
    editingController = widget.item.controller ?? TextEditingController();
    isObscure = widget.item.isPassword;
  }

  @override
  void dispose() {
    if (_ownsController) {
      editingController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    return TextFormField(
      controller: editingController,
      focusNode: item.focusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: item.keyboardType,
      autofillHints: item.autofillHints,
      obscureText: item.isPassword ? isObscure : false,
      validator: item.validator,
      style: TextsStyles.input,
      minLines: item.minLines,
      maxLines: item.maxLines,
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
        hintStyle: TextsStyles.hint,
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
      onTapOutside: (_) {
        if (item.hintText != 'Type a message') {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
    );
  }
}
