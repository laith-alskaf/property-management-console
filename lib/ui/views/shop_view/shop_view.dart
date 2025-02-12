import 'package:argb_app/core/general_util.dart';
import 'package:argb_app/ui/shared/colors.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_text.dart';
import 'package:argb_app/ui/views/custom_estate/estate_view.dart';
import 'package:argb_app/ui/views/shop_view/add_shop_view.dart';
import 'package:argb_app/ui/views/shop_view/shop_controller.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(
        init: ShopController(),
        builder: (controller) {
          return EstateView(
            filterWidget: ZoomIn(
              delay: const Duration(microseconds: 800),
              child: Container(
                alignment: Alignment.center,
                height: 55.h,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(controller.shopType.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        controller.currentApartType = index;
                        controller.initListFilterShop();
                        controller.update();
                      },
                      child: SizedBox(
                        width: 130.w,
                        height: 50.h,
                        child: Column(
                          children: [
                            CustomText(
                              text: controller.shopType[index],
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
            estateType: myAppController.estateType[1],
            onTap: () {
              Get.to(() => AddShopView());
            },
            swipeActionController: controller.swipeActionController,
          );
        });
  }
}
