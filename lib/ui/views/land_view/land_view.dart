import 'package:argb_app/core/general_util.dart';
import 'package:argb_app/ui/views/custom_estate/estate_view.dart';
import 'package:argb_app/ui/views/land_view/add_land_view/add_land_view.dart';
import 'package:argb_app/ui/views/land_view/land_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LandView extends StatelessWidget {
const   LandView({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandController>(
        init: LandController(),
        builder: (controller){
      return EstateView(
        filterWidget: const SizedBox(),
        showEstates: controller.allEstates.obs,
        estateType: myAppController.estateType[2],
        onTap: () {
          Get.to(() => AddLandView());
        }, swipeActionController: controller.swipeActionController,
      );
    });
  }
}
