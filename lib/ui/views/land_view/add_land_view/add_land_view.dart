import 'package:argb_app/ui/shared/colors.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_text.dart';
import 'package:argb_app/ui/shared/extension_sizebox.dart';
import 'package:argb_app/ui/views/custom_estate/add_estate_view.dart';
import 'package:argb_app/ui/views/estate_type_view/estate_type_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AddLandView extends StatelessWidget {
  AddLandView({super.key, this.onPressed});

  EstateTypeController controller = Get.find();
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AddEstateView(widgets: [
      Obx(
        () => Row(
          textDirection: TextDirection.rtl,
          children: [
            const CustomText(
              text: 'يوجد بناء: ',
              fontWeight: FontWeight.w500,
              textType: TextStyleType.body,
            ),
            (20.w).pw,
            SizedBox(
              width: 20.w,
              child: Radio(
                fillColor: WidgetStateProperty.resolveWith((Set states) {
                  if (states.contains(WidgetState.selected)) {
                    return AppColors.mainColor;
                  }
                  return AppColors.blackColor;
                }),
                value: true,
                groupValue: controller.currentEstateType != 'أرض'
                    ? controller.thereBuilding.value
                    : controller.isFurnished.value,
                onChanged: (value) {
                  if (controller.currentEstateType != 'أرض') {
                    controller.thereBuilding.value =
                        bool.parse(value.toString());
                  } else {
                    controller.isFurnished.value = bool.parse(value.toString());
                  }
                },
              ),
            ),
            (10.w).pw,
            const CustomText(
              text: 'نعم',
              textType: TextStyleType.body,
              fontWeight: FontWeight.normal,
            ),
            (50.w).pw,
            SizedBox(
              width: 20.w,
              child: Radio(
                fillColor: WidgetStateProperty.resolveWith((Set states) {
                  if (states.contains(WidgetState.selected)) {
                    return AppColors.mainColor;
                  }
                  return AppColors.blackColor;
                }),
                value: false,
                groupValue: controller.currentEstateType != 'أرض'
                    ? controller.thereBuilding.value
                    : controller.isFurnished.value,
                onChanged: (value) {
                  if (controller.currentEstateType != 'أرض') {
                    controller.thereBuilding.value =
                        bool.parse(value.toString());
                  } else {
                    controller.isFurnished.value = bool.parse(value.toString());
                  }
                },
              ),
            ),
            (10.w).pw,
            const CustomText(
                text: 'لا',
                fontWeight: FontWeight.w500,
                textType: TextStyleType.body)
          ],
        ),
      ),
      (20.h).ph,
      Obx(
        () => Row(
          textDirection: TextDirection.rtl,
          children: [
            const CustomText(
              text: ' مزروعة:* ',
              fontWeight: FontWeight.w500,
              textType: TextStyleType.body,
            ),
            (20.w).pw,
            SizedBox(
              width: 20.w,
              child: Radio(
                fillColor: WidgetStateProperty.resolveWith((Set states) {
                  if (states.contains(WidgetState.selected)) {
                    return AppColors.mainColor;
                  }
                  return AppColors.blackColor;
                }),
                value: true,
                groupValue: controller.isPlanted.value,
                onChanged: (value) {
                  controller.isPlanted.value = bool.parse(value.toString());
                },
              ),
            ),
            (10.w).pw,
            const CustomText(
              text: 'نعم',
              textType: TextStyleType.body,
              fontWeight: FontWeight.normal,
            ),
            (50.w).pw,
            SizedBox(
              width: 20.w,
              child: Radio(
                fillColor: WidgetStateProperty.resolveWith((Set states) {
                  if (states.contains(WidgetState.selected)) {
                    return AppColors.mainColor;
                  }
                  return AppColors.blackColor;
                }),
                value: false,
                groupValue: controller.isPlanted.value,
                onChanged: (value) {
                  controller.isPlanted.value = bool.parse(value.toString());
                },
              ),
            ),
            (10.w).pw,
            const CustomText(
                text: 'لا',
                fontWeight: FontWeight.w500,
                textType: TextStyleType.body)
          ],
        ),
      ),
    ], onPressed: onPressed);
  }
}
