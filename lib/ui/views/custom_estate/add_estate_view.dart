import 'dart:io';

import 'package:argb_app/ui/shared/colors.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_row_info.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_scaffold.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_text.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_text_field.dart';
import 'package:argb_app/ui/shared/custom_widget/drop_menu.dart';
import 'package:argb_app/ui/shared/extension_sizebox.dart';
import 'package:argb_app/ui/views/estate_type_view/estate_type_controller.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AddEstateView extends StatelessWidget {
  AddEstateView(
      {super.key, required this.widgets, this.onPressed, this.isEdit});

  EstateTypeController controller = Get.find();
  final List<Widget> widgets;
  final Function()? onPressed;
  final bool? isEdit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScaffold(
            body: Form(
      key: controller.formKey,
      child: ListView(
        children: [
          (10.h).ph,
          Obx(
            () => FadeInLeft(
              delay: const Duration(milliseconds: 200),
              duration: const Duration(milliseconds: 400),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: controller.expandedContainer[0] == false ? 70.h : 320.h,
                width: 1.sw,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(15.r),
                  color: AppColors.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.mainColor.withOpacity(0.5),
                      spreadRadius: 0.5,
                      blurRadius: 1,
                      offset: const Offset(0.5, 0.5),
                    ),
                  ],
                ),
                padding: EdgeInsetsDirectional.only(
                  start: 30.w,
                  end: 30.w,
                  top: 25.h,
                  // bottom:
                  //     controller.expandedContainer[0] == false ? 0 : 27.h
                ),
                child: Scrollbar(
                  thickness: 1.5,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      GestureDetector(
                          onTap: () {
                            controller.clickToExpanded(index: 0);
                          },
                          child: CustomRowInfo(
                            index: 0,
                            controller: controller,
                            title: 'معلومات العقار',
                          )),
                      Divider(
                        color: AppColors.blackColor,
                        height: 10.h,
                        thickness: 0.3,
                      ),
                      (10.h).ph,
                      Visibility(
                          visible: controller.expandedContainer[0],
                          child: ZoomIn(
                            delay: const Duration(milliseconds: 500),
                            duration: const Duration(milliseconds: 500),
                            child: Column(
                              textDirection: TextDirection.rtl,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (controller.currentEstateType != 'أرض') ...[
                                  const CustomText(
                                    text: 'حالة العقار:*',
                                    textType: TextStyleType.body,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  DropMenuJob(
                                    value: controller
                                            .estateStateController.text.isEmpty
                                        ? null
                                        : controller.estateStateController.text,
                                    items: controller.estateState,
                                    onSaved: (s) {
                                      controller.estateStateController.text =
                                          s!;
                                    },
                                    messageError: 'الرجاء اختيار حالة العقار',
                                  ),
                                  (20.h).ph,
                                ],
                                const CustomText(
                                  text: 'نوع الملكية:*',
                                  textType: TextStyleType.body,
                                  fontWeight: FontWeight.w500,
                                ),
                                DropMenuJob(
                                  value: controller
                                          .ownershipTypeController.text.isEmpty
                                      ? null
                                      : controller.ownershipTypeController.text,
                                  items: controller.ownershipTypes,
                                  onSaved: (s) {
                                    controller.ownershipTypeController.text =
                                        s!;
                                  },
                                  messageError: 'الرجاء اختيار نوع الملكية',
                                ),
                                (20.h).ph,
                                CustomText(
                                  text: 'الموقع:*',
                                  textType: TextStyleType.body,
                                  fontWeight: FontWeight.w500,
                                  bottomPadding: 3.h,
                                ),
                                CustomTextFormField(
                                  keyboardType: TextInputType.streetAddress,
                                  widthContainer: 1.sw,
                                  controller: controller.locationController,
                                  hintText: 'شارع الجمهورية جانب المؤسسة',
                                  maxLength: 30,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'الرجاء ادخال الموقع';
                                    }
                                    return null;
                                  },
                                ),
                                (20.h).ph,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Column(
                                        textDirection: TextDirection.rtl,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: 'المساحة:* ',
                                            textType: TextStyleType.body,
                                            fontWeight: FontWeight.w500,
                                            bottomPadding: 5.h,
                                          ),
                                          CustomTextFormField(
                                            keyboardType: TextInputType.number,
                                            widthContainer: 190.w,
                                            controller:
                                                controller.spaceController,
                                            maxLength: 5,
                                            hintText: '120 متر',
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'الرجاء ادخال المساحة';
                                              }
                                              return null;
                                            },
                                          ),
                                        ]),
                                    (40.w).pw,
                                    Column(
                                      textDirection: TextDirection.rtl,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: 'السعر:*',
                                          textType: TextStyleType.body,
                                          fontWeight: FontWeight.w500,
                                          bottomPadding: 5.h,
                                        ),
                                        CustomTextFormField(
                                          widthContainer: 190.w,
                                          controller:
                                              controller.priceController,
                                          keyboardType: TextInputType.number,
                                          maxLength: 4,
                                          hintText: '320 مليون',
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'الرجاء ادخال السعر';
                                            }
                                            return null;
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                (20.h).ph,
                                ...widgets,
                                CustomText(
                                  text: 'مميزات العقار:*',
                                  textType: TextStyleType.body,
                                  fontWeight: FontWeight.w500,
                                  bottomPadding: 5.h,
                                ),
                                CustomTextFormField(
                                  widthContainer: 1.sw,
                                  controller: controller.specialController,
                                  keyboardType: TextInputType.text,
                                  hintText: '',
                                ),
                                (20.h).ph,
                                CustomText(
                                  text: ' ملاحظة:*',
                                  textType: TextStyleType.body,
                                  fontWeight: FontWeight.w500,
                                  bottomPadding: 5.h,
                                ),
                                CustomTextFormField(
                                  widthContainer: 1.sw,
                                  controller: controller.noteController,
                                  keyboardType: TextInputType.text,
                                  hintText: '',
                                ),
                              ],
                            ),
                          )),
                      (10.h).ph,
                    ],
                  ),
                ),
              ),
            ),
          ),
          (20.h).ph,
          Obx(
            () => FadeInLeft(
              delay: const Duration(milliseconds: 200),
              duration: const Duration(milliseconds: 400),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 1.sw,
                height: controller.expandedContainer[1] == true ? 200.h : 80.h,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(15.r),
                  color: AppColors.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.mainColor.withOpacity(0.5),
                      spreadRadius: 0.5,
                      blurRadius: 1,
                      offset: const Offset(0.5, 0.5),
                    ),
                  ],
                ),
                padding: EdgeInsetsDirectional.only(
                    start: 30.w,
                    end: 30.w,
                    top: 25.h,
                    bottom: controller.expandedContainer[1] == true ? 27.h : 0),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    GestureDetector(
                        onTap: () {
                          controller.expandedContainer[1] =
                              !controller.expandedContainer[1];
                        },
                        child: CustomRowInfo(
                          title: 'معلومات المالك',
                          index: 1,
                          controller: controller,
                        )),
                    Divider(
                      color: AppColors.blackColor,
                      height: 10.h,
                      thickness: 0.3,
                    ),
                    (10.h).ph,
                    Visibility(
                      visible: controller.expandedContainer[1],
                      child: ZoomIn(
                        delay: const Duration(milliseconds: 500),
                        duration: const Duration(milliseconds: 500),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Column(
                                          textDirection: TextDirection.rtl,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text: 'الأسم:* ',
                                              textType: TextStyleType.body,
                                              fontWeight: FontWeight.w500,
                                              bottomPadding: 5.h,
                                            ),
                                            CustomTextFormField(
                                              keyboardType: TextInputType.name,
                                              widthContainer: 190.w,
                                              heightContainer: 75.h,
                                              controller: controller
                                                  .ownerNameController,
                                              hintText: 'ليث السكاف',
                                              maxLength: 16,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'الرجاء ادخال الأسم';
                                                }
                                                return null;
                                              },
                                            ),
                                          ]),
                                      (40.w).pw,
                                      Column(
                                        textDirection: TextDirection.rtl,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: 'الرقم:*',
                                            textType: TextStyleType.body,
                                            fontWeight: FontWeight.w500,
                                            bottomPadding: 5.h,
                                          ),
                                          CustomTextFormField(
                                            widthContainer: 190.w,
                                            heightContainer: 65.h,
                                            controller: controller
                                                .contactOwnerController,
                                            keyboardType: TextInputType.number,
                                            maxLength: 10,
                                            hintText: '0982055788',
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'الرجاء ادخال الرقم';
                                              }
                                              return null;
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          (20.h).ph,
          Obx(
            () => FadeInLeft(
              delay: const Duration(milliseconds: 200),
              duration: const Duration(milliseconds: 400),
              child: Container(
                width: 1.sw,
                // height: 240.h,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(15.r),
                  color: AppColors.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.mainColor.withOpacity(0.5),
                      spreadRadius: 0.5,
                      blurRadius: 1,
                      offset: const Offset(0.5, 0.5),
                    ),
                  ],
                ),
                child: Column(
                  textDirection: TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: 'صور العقار:*',
                      textType: TextStyleType.body,
                      fontWeight: FontWeight.w600,
                    ),
                    (10.h).ph,
                    Container(
                      padding:
                          EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
                      height: 50.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.r)),
                          color: AppColors.blackColor.withOpacity(0.02),
                          border: Border.all(color: AppColors.mainColor)),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          FadeInLeft(
                            delay: const Duration(milliseconds: 700),
                            duration: const Duration(milliseconds: 500),
                            child: Icon(
                              Icons.photo_library_sharp,
                              color: controller.images.isNotEmpty
                                  ? AppColors.mainColor
                                  : AppColors.blackColor.withOpacity(0.3),
                            ),
                          ),
                          (10.w).pw,
                          ZoomIn(
                            duration: const Duration(milliseconds: 700),
                            child: CustomText(
                              text: 'اضغط هنا لاختيار الصور',
                              textType: TextStyleType.body,
                              fontWeight: FontWeight.normal,
                              textColor: AppColors.blackColor.withOpacity(0.3),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () async {
                              await controller.pickFile(
                                  type: FileTypeEnum.gallery);
                            },
                            child: const Icon(
                              Icons.attach_file,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (controller.images.isNotEmpty) ...[
                      (20.h).ph,
                      Center(
                        child: Container(
                          width: 1.sw,
                          height: 150.w,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadiusDirectional.circular(15.r),
                            color: AppColors.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.mainColor.withOpacity(0.5),
                                spreadRadius: 0.5,
                                blurRadius: 1,
                                offset: const Offset(0.5, 0.5),
                              ),
                            ],
                          ),
                          child: Scrollbar(
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                    controller.images.length, (index) {
                                  return Container(
                                    alignment: Alignment.topRight,
                                    margin: EdgeInsets.only(
                                        left: 10.w,
                                        right: index + 1 == 3 ? 10.w : 0,
                                        top: 10.w,
                                        bottom: 10.w),
                                    width: 150.w,
                                    height: 150.w,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(
                                              File(controller.images[index]))),
                                      borderRadius:
                                          BorderRadiusDirectional.circular(
                                              15.r),
                                      color: AppColors.blackColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.mainColor
                                              .withOpacity(0.5),
                                          spreadRadius: 0.5,
                                          blurRadius: 1,
                                          offset: const Offset(0.5, 0.5),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.w),
                                      child: GestureDetector(
                                        onTap: () {
                                          controller.images.removeAt(index);
                                          controller.update();
                                        },
                                        child: const Icon(Icons.cancel_outlined,
                                            color: AppColors.redColor),
                                      ),
                                    ),
                                  );
                                })),
                          ),
                        ),
                      )
                    ]
                  ],
                ),
              ),
            ),
          ),
          (20.h).ph,
          ZoomIn(
            delay: const Duration(milliseconds: 300),
            duration: const Duration(milliseconds: 500),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: controller.onPress.value ? 0 : 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Center(
                  child: SizedBox(
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: onPressed ??
                          () {
                            controller.handleAddClick();
                          },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(1.sw, 20.h),
                        backgroundColor: AppColors.mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: CustomText(
                        textType: TextStyleType.body,
                        textColor: AppColors.whiteColor,
                        fontWeight: FontWeight.w600,
                        text: 'حفظ العقار',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          (20.h).ph,
        ],
      ),
    )));
  }
}
