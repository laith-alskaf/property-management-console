import 'package:argb_app/ui/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.fillColor,
    this.hintTextColor,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconColor,
    this.hintTextSize,
    this.maxLines,
    this.onFieldSubmitted,
    this.onChanged,
    this.suffixOnTap,
    this.heightContainer,
    this.widthContainer,
    this.contentPadding,
    this.colorBorder,
    this.readOnly,
    this.initialValue,
    this.suffixWidget, this.maxLength,
  });

  final String hintText;
  final TextEditingController? controller;
  final Color? fillColor;
  final Color? hintTextColor;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool? readOnly;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final String? suffixIcon;
  final Widget? suffixWidget;
  final String? initialValue;
  final Color? colorBorder;
  final Function()? suffixOnTap;
  final Color? suffixIconColor;
  final double? hintTextSize;
  final double? heightContainer;
  final double? widthContainer;
  final EdgeInsets? contentPadding;
  final int? maxLines;
  final int? maxLength;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightContainer,
      width: widthContainer,
      child: TextFormField(
        textDirection: TextDirection.rtl,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        maxLines: maxLines ?? 1,
        onChanged: onChanged,maxLength:maxLength ,
        readOnly: readOnly ?? false,
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        initialValue: initialValue,
        textAlign: TextAlign.start,
        cursorColor: AppColors.mainColor,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,hintTextDirection: TextDirection.rtl,
          suffixIcon: suffixWidget,
          suffixIconColor: suffixIconColor,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: colorBorder ?? AppColors.mainColor,
            ),
            borderRadius: BorderRadius.circular(15.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(
              color: colorBorder ?? AppColors.mainColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colorBorder ?? AppColors.mainColor,
            ),
            borderRadius: BorderRadius.circular(15.r),
          ),
          filled: true,
          hintStyle: TextStyle(
            color: hintTextColor ?? AppColors.grayColor,
            fontSize: hintTextSize ?? 18.sp,
          ),
          hintText: hintText,
          fillColor: fillColor ?? AppColors.whiteColor,
        ),
        keyboardType: keyboardType ?? TextInputType.text,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}
