import 'package:argb_app/ui/shared/colors.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_text.dart';
import 'package:argb_app/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, required this.body, this.addWidget});

  final Widget body;
  final Widget? addWidget;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: const SizedBox(),
            centerTitle: true,
            // title: ZoomIn(
            //   child: CustomText(
            //       textColor: AppColors.whiteColor,
            //       textType: TextStyleType.title,
            //       fontWeight: FontWeight.bold,
            //       text: owner),
            // )
            toolbarHeight: 80.h,
            flexibleSpace: AnimatedContainer(
                alignment: Alignment.center,
                duration: const Duration(milliseconds: 800),
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    boxShadow: null,
                    border:
                        Border.all(color: AppColors.mainColor, width: 0.1.w),
                    borderRadius: BorderRadiusDirectional.only(
                      bottomStart: const Radius.circular(45).r,
                      bottomEnd: const Radius.circular(45).r,
                    )),
                width: double.infinity,
                height: 80.h,
                child: CustomText(
                  text: owner,
                  textType: TextStyleType.subtitle,
                  textColor: AppColors.whiteColor,
                  fontSize: 35.sp,
                  fontWeight: FontWeight.bold,
                )),
          ),
          floatingActionButton: addWidget,
          backgroundColor: AppColors.whiteColor,
          body: body),
    );
  }
}
