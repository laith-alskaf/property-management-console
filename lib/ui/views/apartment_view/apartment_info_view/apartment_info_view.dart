import 'package:argb_app/core/model2/estate_model.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_row_estate_info.dart';
import 'package:argb_app/ui/shared/extension_sizebox.dart';
import 'package:argb_app/ui/views/apartment_view/add_apartment_view.dart';
import 'package:argb_app/ui/views/apartment_view/apartment_controller.dart';
import 'package:argb_app/ui/views/custom_estate/estate_info_view.dart';
import 'package:argb_app/ui/views/estate_type_view/estate_type_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ApartmentInfoView extends StatelessWidget {
  const ApartmentInfoView(
      {super.key, required this.estate, required this.index});

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
            title: 'مفروشة: ',
            body: estate.info!.apartmentInfo!.isFurnished! ? 'نعم' : 'لا'),
        (10.h).ph,
        CustomRowEstateInfo(
            fontSize: 22.sp,
            isEstateInfoView: true,
            title: 'عدد الغرف: ',
            body: estate.info!.apartmentInfo!.numBed.toString()),
        (10.h).ph,
        CustomRowEstateInfo(
            fontSize: 22.sp,
            isEstateInfoView: true,
            title: 'طابق: ',
            body: estate.info!.apartmentInfo!.floor.toString()),
      ],
      widgetsRight: [
        CustomRowEstateInfo(
            fontSize: 22.sp,
            isEstateInfoView: true,
            title: 'حالة الشقة: ',
            body: estate.info!.apartmentInfo!.apartmentType!),
        (10.h).ph,
      ],
      editOnTap: () {
        EstateTypeController estateTypeController = Get.find();
        estateTypeController.handleEditEstate(estate: estate, index: index);
        Get.to(() => AddApartmentView(onPressed: () async {
              ApartmentController apartmentController = Get.find();
              await estateTypeController.handleAddClick().then((s) {
                apartmentController.removeApartment(
                    numberView: estate.numberView!);
              });
            }));
      },
    );
  }
}
