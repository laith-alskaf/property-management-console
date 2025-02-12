import 'package:argb_app/ui/shared/colors.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_button.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_text.dart';
import 'package:argb_app/ui/shared/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

showAlertDelete({required String text, required Function onTap}) {
  Get.dialog(Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(35.r))),
    backgroundColor: AppColors.whiteColor,
    insetPadding: const EdgeInsets.only(),
    child: IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(35.r)),
          color: AppColors.whiteColor,
        ),
        width: 460.w,
        // height: 180.h,
        child: Padding(
          padding: EdgeInsets.all(25.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                      width: 48.w,
                      height: 43.w,
                      child: Icon(
                        Icons.remove_circle_outlined,
                        color: AppColors.redColor,
                        size: 35.w,
                      )),
                  CustomText(
                    textType: TextStyleType.title,
                    fontSize: 26.sp,
                    text: 'Confirm Delete',
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.mainColor,
                  ),
                ],
              ),
              Row(
                children: [
                  (50.w).pw,
                  Flexible(
                    flex: 8,
                    child: CustomText(
                      text: text,
                      textType: TextStyleType.bodyBig,
                      textColor: AppColors.mainColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(end: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      buttonTypeEnum: ButtonTypeEnum.small,
                      backgroundColor: AppColors.whiteColor,
                      borderColor: AppColors.mainColor,
                      textColor: AppColors.mainColor,
                      onPressed: () {
                        Get.back();
                      },
                      text: 'إلغاء',
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    CustomButton(
                      buttonTypeEnum: ButtonTypeEnum.small,
                      backgroundColor: AppColors.mainColor,
                      onPressed: onTap,
                      text: 'موافق',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  ));
}
