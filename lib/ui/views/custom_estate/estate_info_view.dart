import 'dart:io';
import 'package:argb_app/core/model2/estate_model.dart';
import 'package:argb_app/ui/shared/colors.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_button.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_row_estate_info.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_scaffold.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_text.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_text_field.dart';
import 'package:argb_app/ui/shared/extension_sizebox.dart';
import 'package:argb_app/ui/views/estate_type_view/estate_type_controller.dart';
import 'package:argb_app/ui/views/photo_view/photo_view.dart';
import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EstateInfoView extends StatelessWidget {
  const EstateInfoView(
      {super.key,
      required this.estate,
      required this.widgetsRight,
      required this.widgetsLeft,
      required this.index,
      this.editOnTap});

  final EstateModel estate;
  final List<Widget> widgetsRight;
  final List<Widget> widgetsLeft;
  final int index;
  final Function()? editOnTap;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      addWidget: GestureDetector(
        onTap: editOnTap,
        child: Container(
            margin: EdgeInsets.only(bottom: 20.w, right: 20.w),
            height: 90.w,
            width: 90.w,
            decoration: BoxDecoration(
              color: AppColors.mainColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Icon(
              Icons.mode_edit_sharp,
              size: 40.w,
              color: AppColors.whiteColor,
            )),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          children: [
            (20.h).ph,
            GetBuilder<EstateTypeController>(builder: (controller) {
              return CarouselSlider.builder(
                carouselController: controller.buttonCarouselController,
                itemBuilder: (context, index, realIndex) {
                  return FadeInUp(
                    delay: const Duration(milliseconds: 100),
                    duration: const Duration(milliseconds: 800),
                    child: Align(
                        child: GestureDetector(
                      onTap: () {
                        if (estate.info!.images!.isNotEmpty) {
                          Get.to(() => HeroPhotoViewRouteWrapper(
                                imageProvider: estate.info!.images!,
                              ));
                        }
                      },
                      child: Container(
                        width: 350.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: estate.info!.images!.isEmpty
                                  ? const AssetImage('assets/images/logo.jpg')
                                  : FileImage(
                                      File(estate.info!.images![index])),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
                        ),
                      ),
                    )),
                  );
                },
                itemCount: estate.info!.images!.length,
                options: CarouselOptions(
                  initialPage: 0,
                  height: 200.h,
                  enlargeCenterPage: true,
                  viewportFraction: 0.7,
                  enlargeFactor: 0.3,
                  onPageChanged: controller.onPageChanged1,
                  autoPlay: false,
                ),
              );
            }),
            (20.h).ph,
            ZoomIn(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(20.r)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.mainColor.withOpacity(0.5),
                      spreadRadius: 1.0,
                      blurRadius: 5.0,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (20.w).ph,
                    Align(
                      alignment: Alignment.center,
                      child: CustomText(
                        text: 'مواصفات العقار',
                        textType: TextStyleType.subtitle,
                        textColor: AppColors.mainColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IntrinsicWidth(
                      child: Container(
                        margin: EdgeInsets.only(top: 10.h),
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        height: 40.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.r)),
                            border: Border(
                                top: BorderSide(color: AppColors.mainColor),
                                left: BorderSide(color: AppColors.mainColor))),
                        child: CustomText(
                          isTextAlign: TextAlign.center,
                          text: estate.location!,
                          textType: TextStyleType.small,
                          maxLines: 1,
                        ),
                      ),
                    ),
                    Divider(
                      color: AppColors.mainColor,
                      height: 1.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (10.h).ph,
                            CustomRowEstateInfo(
                                fontSize: 22.sp,
                                isEstateInfoView: true,
                                title: "رقم العرض: ",
                                body: estate.numberView.toString()),
                            (10.h).ph,
                            CustomRowEstateInfo(
                                fontSize: 22.sp,
                                isEstateInfoView: true,
                                title: 'نوع العقار: ',
                                body: estate.estateType!),
                            (10.h).ph,
                            CustomRowEstateInfo(
                                fontSize: 22.sp,
                                isEstateInfoView: true,
                                title: 'حالة العقار: ',
                                body: estate.estateState!),
                            (10.h).ph,
                            ...widgetsRight,
                            CustomRowEstateInfo(
                                fontSize: 22.sp,
                                isEstateInfoView: true,
                                title: 'السعر: ',
                                body: estate.price.toString()),
                            (10.h).ph,
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 10.w),
                          width: 2.w,
                          height: 130.h,
                          color: AppColors.mainColor,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (10.h).ph,
                            CustomRowEstateInfo(
                                fontSize: 22.sp,
                                isEstateInfoView: true,
                                title: 'نوع الملكية: ',
                                body: estate.ownershipType!),
                            (10.h).ph,
                            ...widgetsLeft,
                          ],
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: CustomText(
                        endPadding: 10.w,
                        bottomPadding: 10.w,
                        text:
                            '${estate.dateTime!.year}/${estate.dateTime!.month}/${estate.dateTime!.day}',
                        textType: TextStyleType.small,
                        textColor: AppColors.mainColor,
                      ),
                    ),
                    if (estate.info!.special!.isNotEmpty ||
                        estate.info!.note!.isNotEmpty)
                      Divider(
                        color: AppColors.mainColor,
                        height: 1.h,
                      ),
                    if (estate.info!.special!.isNotEmpty) ...[
                      Container(
                        margin: EdgeInsets.only(top: 10.h),
                        width: 150.w,
                        height: 50.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.r))),
                        child: CustomText(
                          text: 'مميزات الشقة',
                          textType: TextStyleType.bodyBig,
                          textColor: AppColors.whiteColor,
                        ),
                      ),
                      Container(
                        width: 1.sw,
                        color: AppColors.mainColor,
                        padding: EdgeInsets.all(20.w),
                        margin: const EdgeInsets.only(right: 0),
                        child: CustomText(
                          heightText: 1.3,
                          text: estate.info!.special!,
                          textType: TextStyleType.bodyBig,
                          textColor: AppColors.whiteColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      (10.h).ph,
                    ],
                    if (estate.info!.note!.isNotEmpty) ...[
                      Container(
                        width: 150.w,
                        height: 50.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.r))),
                        child: CustomText(
                          text: 'ملاحظات',
                          textType: TextStyleType.bodyBig,
                          textColor: AppColors.whiteColor,
                        ),
                      ),
                      Container(
                        width: 1.sw,
                        padding: EdgeInsets.all(20.w),
                        margin: const EdgeInsets.only(right: 0),
                        decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.r),
                                bottomRight: Radius.circular(20.r))),
                        child: CustomText(
                          heightText: 1.3,
                          text: estate.info!.note!,
                          textType: TextStyleType.bodyBig,
                          textColor: AppColors.whiteColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                    // (20.w).ph,
                  ],
                ),
              ),
            ),
            (20.h).ph,
            GetBuilder<EstateTypeController>(builder: (controller) {
              return ZoomIn(
                duration: const Duration(milliseconds: 600),
                child: GestureDetector(
                  onTap: () {
                    controller.showContactOwner = false;
                    controller.update();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.mainColor.withOpacity(0.5),
                          spreadRadius: 1.0,
                          blurRadius: 5.0,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: controller.showContactOwner
                        ? Column(
                            children: [
                              CustomText(
                                topPadding: 10.h,
                                text: 'معلومات المالك',
                                textType: TextStyleType.subtitle,
                                textColor: AppColors.mainColor,
                                fontWeight: FontWeight.bold,
                              ),
                              Divider(
                                color: AppColors.mainColor,
                              ),
                              (10.h).ph,
                              CustomRowEstateInfo(
                                  fontSize: 22.sp,
                                  isEstateInfoView: true,
                                  title: 'الأسم: ',
                                  body: estate.info!.ownerName!),
                              (20.h).ph,
                              CustomRowEstateInfo(
                                  fontSize: 22.sp,
                                  isEstateInfoView: true,
                                  title: 'رقم المالك: ',
                                  body: estate.info!.contactOwner.toString()),
                              (10.h).ph,
                            ],
                          )
                        : Column(
                            children: [
                              (20.h).ph,
                              CustomTextFormField(
                                controller: controller.inputPass,
                                widthContainer: 250.w,
                                heightContainer: 40.h,
                                hintText: 'ادخل كلمة المرور',
                                keyboardType: TextInputType.number,
                              ),
                              (20.h).ph,
                              CustomButton(
                                  onPressed: () {
                                    controller.validatePass();
                                  },
                                  text: 'عرض معلومات المالك',
                                  height: 40.h,
                                  buttonTypeEnum: ButtonTypeEnum.medium),
                              (20.h).ph,
                            ],
                          ),
                  ),
                ),
              );
            }),
            (20.h).ph,
          ],
        ),
      ),
    );
  }
}
