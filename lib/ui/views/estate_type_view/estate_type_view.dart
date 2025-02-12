import 'package:argb_app/core/general_util.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_container.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_scaffold.dart';
import 'package:argb_app/ui/views/estate_type_view/estate_type_controller.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class EstateTypeView extends StatelessWidget {
  EstateTypeView({super.key});

  EstateTypeController controller = Get.put(EstateTypeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: GetBuilder<EstateTypeController>(
      builder: (c) {
        return CustomScaffold(
            body: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
          child: Align(
            alignment: Alignment.center,
            child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 100.w,
                runSpacing: 100.w,
                children: List.generate(myAppController.estateType.length,
                    (index) {
                  return FadeInLeft(
                    duration: const Duration(milliseconds: 500),
                    delay: Duration(milliseconds: 500 * (index + 1)),
                    child: GestureDetector(
                      onTap: () {
                        controller.handleClickEstateType(
                            estateType: myAppController.estateType[index]);
                      },
                      child: ContainerWeek(
                          title: myAppController.estateType[index]),
                    ),
                  );
                })),
          ),
        ));
      },
    ));
  }
}
