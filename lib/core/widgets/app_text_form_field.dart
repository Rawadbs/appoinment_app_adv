import 'package:appoinment_app_adv/core/theme/colors.dart';
import 'package:appoinment_app_adv/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final String? hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentpadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final Color? backgroundColor;
  const AppTextFormField({
    super.key,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.contentpadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          isDense: true,
          contentPadding: contentpadding ??
              EdgeInsets.symmetric(
                vertical: 18.h,
                horizontal: 20.w,
              ),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: ColorsManger.primary, width: 1.3),
                  borderRadius: BorderRadius.circular(16)),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: ColorsManger.lightergrey, width: 1.3),
                  borderRadius: BorderRadius.circular(16)),
          hintStyle: hintStyle ?? TextStyles.font14greyRegular,
          hintText: hintText,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: backgroundColor ?? ColorsManger.morelightgrey),
      obscureText: isObscureText ?? false,
      style: TextStyles.font14DarkBlueMedium,
    );
  }
}
