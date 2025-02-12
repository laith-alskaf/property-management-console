import 'package:argb_app/ui/shared/colors.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_text.dart';
import 'package:argb_app/ui/shared/custom_widget/drop_menu.dart';
import 'package:argb_app/ui/shared/extension_sizebox.dart';
import 'package:argb_app/ui/views/custom_estate/add_estate_view.dart';
import 'package:argb_app/ui/views/estate_type_view/estate_type_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AddShopView extends StatelessWidget {
  AddShopView({super.key, this.onPressed});

  final Function()? onPressed;
  EstateTypeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return AddEstateView(
      onPressed: onPressed,
      widgets: [
        const CustomText(
          text: 'الأكساء:*',
          textType: TextStyleType.body,
          fontWeight: FontWeight.w500,
        ),
        DropMenuJob(
          value: controller.apartmentStateController.text.isEmpty
              ? null
              : controller.apartmentStateController.text,
          items: controller.apartmentStates,
          onSaved: (s) {
            controller.apartmentStateController.text = s!;
          },
          messageError: 'الرجاء اختيار الأكساء',
        ),
        (20.h).ph,
        Obx(
          () => Row(
            textDirection: TextDirection.rtl,
            children: [
              const CustomText(
                text: 'حمام:*',
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
                  groupValue: controller.isBath.value,
                  onChanged: (value) {
                    controller.isBath.value = bool.parse(value.toString());
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
                  groupValue: controller.isBath.value,
                  onChanged: (value) {
                    controller.isBath.value = bool.parse(value.toString());
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
      ],
    );
  }
}
