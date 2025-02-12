import 'package:argb_app/core/general_util.dart';
import 'package:argb_app/ui/shared/colors.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_text.dart';
import 'package:argb_app/ui/views/apartment_view/apartment_controller.dart';
import 'package:argb_app/ui/views/apartment_view/add_apartment_view.dart';
import 'package:argb_app/ui/views/custom_estate/estate_view.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ApartmentView extends StatelessWidget {
  const ApartmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApartmentController>(
        init: ApartmentController(),
        builder: (controller) {
          return EstateView(
            filterWidget: ZoomIn(
              delay: const Duration(microseconds: 800),
              child: Container(
                alignment: Alignment.center,
                width: 700.w,
                height: 60.h,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:
                      List.generate(controller.apartmentType.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        controller.currentApartType = index;
                        controller.initListFilterApartment();
                        controller.update();
                      },
                      child: SizedBox(
                        width: 130.w,
                        height: 50.h,
                        child: Column(
                          children: [
                            CustomText(
                              text: controller.apartmentType[index],
                              textType: TextStyleType.subtitle,
                              bottomPadding: 10.h,
                            ),
                            if (controller.currentApartType == index)
                              Container(
                                width: 130.w,
                                color: AppColors.mainColor,
                                height: 5.h,
                              )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            showEstates: controller.showEstates,
            estateType: myAppController.estateType[0],
            onTap: () {
              Get.to(() => AddApartmentView());
            },
            swipeActionController: controller.swipeActionController,
          );
        });
  }
}
