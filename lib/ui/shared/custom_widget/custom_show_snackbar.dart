import 'package:argb_app/ui/shared/colors.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

showSnackBar({required String title, int? milliseconds, int? seconds}) {
  Get.snackbar('', '',
      snackPosition: SnackPosition.BOTTOM,
      duration:
          Duration(milliseconds: milliseconds ?? 800, seconds: seconds ?? 0),
      padding: EdgeInsets.only(top: 10.h),
      borderRadius: 15.r,
      backgroundColor: AppColors.mainColor,
      titleText: Center(
        child: CustomText(
          text: title,
          textType: TextStyleType.bodyBig,
          fontSize: 23.sp,
          textColor: AppColors.whiteColor,
        ),
      ));
}
