import 'package:argb_app/core/model2/estate_model.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_row_estate_info.dart';
import 'package:argb_app/ui/shared/extension_sizebox.dart';
import 'package:argb_app/ui/views/custom_estate/estate_info_view.dart';
import 'package:argb_app/ui/views/estate_type_view/estate_type_controller.dart';
import 'package:argb_app/ui/views/land_view/add_land_view/add_land_view.dart';
import 'package:argb_app/ui/views/land_view/land_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LandInfoView extends StatelessWidget {
  const LandInfoView({super.key, required this.estate, required this.index});

  final EstateModel estate;
  final int index;

  @override
  Widget build(BuildContext context) {
    return EstateInfoView(
      estate: estate,
      widgetsLeft: [
        CustomRowEstateInfo(
            fontSize: 22.sp,
            isEstateInfoView: true,
            title: 'يوجد بناء: ',
            body: estate.info!.landInfo!.building! ? 'نعم' : 'لا'),
        (10.h).ph,
        CustomRowEstateInfo(
            fontSize: 22.sp,
            isEstateInfoView: true,
            title: 'مزروعة: ',
            body: estate.info!.landInfo!.building! ? 'نعم' : 'لا'),
        (10.h).ph,
      ],
      widgetsRight: const [],
      index: index,
      editOnTap: () async {
        EstateTypeController estateTypeController = Get.find();
        estateTypeController.handleEditEstate(estate: estate, index: index);

        Get.to(() => AddLandView(onPressed: () async {
              LandController landController = Get.find();
              await estateTypeController.handleAddClick().then((s) {
                landController.removeLand(numberView: estate.numberView!);
                Get.back();
              });
            }));
      },
    );
  }
}
