import 'package:argb_app/core/model2/estate_model.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_row_estate_info.dart';
import 'package:argb_app/ui/views/custom_estate/estate_info_view.dart';
import 'package:argb_app/ui/views/estate_type_view/estate_type_controller.dart';
import 'package:argb_app/ui/views/shop_view/add_shop_view.dart';
import 'package:argb_app/ui/views/shop_view/shop_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShopInfoView extends StatelessWidget {
  const ShopInfoView({super.key, required this.estate, required this.index});

  final EstateModel estate;
  final int index;

  @override
  Widget build(BuildContext context) {
    return EstateInfoView(
      index: index,
      estate: estate,
      widgetsLeft: [
        CustomRowEstateInfo(
            fontSize: 22.sp,
            isEstateInfoView: true,
            title: 'حمام: ',
            body: estate.info!.shopInfoModel!.isBath! ? 'نعم' : 'لا'),
      ],
      widgetsRight: const [],
      editOnTap: () {
        EstateTypeController estateTypeController = Get.find();
        estateTypeController.handleEditEstate(estate: estate, index: index);
        Get.to(() => AddShopView(onPressed: () async {
              ShopController shopController = Get.find();
              await estateTypeController.handleAddClick().then((s) {
                shopController.removeShop(numberView: estate.numberView!);
              });
            }));
      },
    );
  }
}
