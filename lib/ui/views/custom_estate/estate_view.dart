import 'dart:io';
import 'package:argb_app/core/general_util.dart';
import 'package:argb_app/core/model2/estate_model.dart';
import 'package:argb_app/ui/shared/colors.dart';
import 'package:argb_app/ui/shared/custom_widget/alert_dialog_delete.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_row_estate_info.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_scaffold.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_show_snackbar.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_text.dart';
import 'package:argb_app/ui/shared/extension_sizebox.dart';
import 'package:argb_app/ui/views/apartment_view/apartment_controller.dart';
import 'package:argb_app/ui/views/apartment_view/apartment_info_view/apartment_info_view.dart';
import 'package:argb_app/ui/views/land_view/land_controller.dart';
import 'package:argb_app/ui/views/land_view/land_info_view.dart';
import 'package:argb_app/ui/views/photo_view/photo_view.dart';
import 'package:argb_app/ui/views/shop_view/shop_controller.dart';
import 'package:argb_app/ui/views/shop_view/shop_info_view/shop_info_view.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:get/get.dart';

class EstateView extends StatelessWidget {
  const EstateView(
      {super.key,
      required this.filterWidget,
      required this.showEstates,
      required this.estateType,
      this.onTap,
      required this.swipeActionController});

  final Widget filterWidget;
  final RxList<EstateModel> showEstates;
  final String estateType;
  final SwipeActionController swipeActionController;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        addWidget: GestureDetector(
          onTap: onTap,
          child: Container(
              margin: EdgeInsets.only(bottom: 20.w, right: 20.w),
              height: 90.w,
              width: 90.w,
              decoration: BoxDecoration(
                color: AppColors.mainColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Icon(
                Icons.add_outlined,
                size: 40.w,
                color: AppColors.whiteColor,
              )),
        ),
        body: Obx(
          () => Column(
            children: [
              (10.h).ph,
              filterWidget,
              (10.h).ph,
              showEstates.isEmpty
                  ? Center(
                      child: CustomText(
                          topPadding: 0.3.sh,
                          textColor: AppColors.blackColor,
                          text: 'صديقي العراب لايوجد شيء لعرضه',
                          textType: TextStyleType.subtitle),
                    )
                  : SizedBox(
                      height: estateType != 'أرض' ? 0.8.sh : 0.85.sh,
                      child: ListView(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        children: List.generate(showEstates.length, (index) {
                          return SwipeActionCell(
                            closeWhenScrolling: true,
                            controller: swipeActionController,
                            backgroundColor: AppColors.whiteColor,
                            key: ObjectKey(showEstates[index]),
                            fullSwipeFactor: 0.4,
                            trailingActions: <SwipeAction>[
                              SwipeAction(
                                  backgroundRadius: 15.r,
                                  icon: Icon(
                                    Icons.delete,
                                    color: AppColors.whiteColor,
                                  ),
                                  title: "حذف",
                                  widthSpace: 120.w,
                                  performsFirstActionWithFullSwipe: true,
                                  onTap: (CompletionHandler handler) async {
                                    swipeActionController.closeAllOpenCell();
                                    showAlertDelete(
                                        text: 'هل انت متأكد تريد حذفها',
                                        onTap: () {
                                          Get.closeAllSnackbars();
                                          if (estateType == 'أرض') {
                                            LandController landController =
                                                Get.find();
                                            storage.boxLand.deleteAt(index);
                                            landController.handleShowData();
                                          } else if (estateType == 'شقة') {
                                            ApartmentController
                                                apartController = Get.find();
                                            apartController.removeApartment(
                                                numberView: showEstates[index]
                                                    .numberView!);
                                          } else if (estateType == 'محل') {
                                            ShopController shopController =
                                                Get.find();
                                            shopController.removeShop(
                                                numberView: showEstates[index]
                                                    .numberView!);
                                          }
                                          Get.back();
                                          showSnackBar(
                                              title: 'تم حذف العقار بنجاح');
                                          if (Get.isDialogOpen == true) {
                                            Get.back();
                                          }
                                        });
                                  },
                                  color: AppColors.redColor),
                            ],
                            child: GestureDetector(
                              onTap: () {
                                if (estateType == 'أرض') {
                                  Get.to(() => LandInfoView(
                                        estate: showEstates[index],
                                        index: index,
                                      ));
                                } else if (estateType == 'شقة') {
                                  Get.to(() => ApartmentInfoView(
                                        index: index,
                                        estate: showEstates[index],
                                      ));
                                } else if (estateType == 'محل') {
                                  Get.to(() => ShopInfoView(
                                        index: index,
                                        estate: showEstates[index],
                                      ));
                                }
                              },
                              child: ZoomIn(
                                duration: const Duration(milliseconds: 500),
                                delay:
                                    Duration(milliseconds: 200 * (index + 2)),
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: index == 0 ? 5.h : 20.h,
                                      left: 20.w,
                                      right: 20.w,
                                      bottom: 5.h),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.mainColor
                                            .withOpacity(0.25),
                                        spreadRadius: 3,
                                        blurRadius: 3,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.r),
                                    ),
                                  ),
                                  width: 1.sw,
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Row(
                                          children: [
                                            FadeInRight(
                                              delay: Duration(
                                                  milliseconds:
                                                      400 * (index + 1)),
                                              duration: const Duration(
                                                  milliseconds: 400),
                                              child: GestureDetector(
                                                onTap: () {
                                                  if (showEstates[index]
                                                      .info!
                                                      .images!
                                                      .isNotEmpty) {
                                                    Get.to(() =>
                                                        HeroPhotoViewRouteWrapper(
                                                          imageProvider:
                                                              showEstates[index]
                                                                  .info!
                                                                  .images!,
                                                        ));
                                                  }
                                                },
                                                child: Container(
                                                  width: 150.w,
                                                  height: 160.w,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: showEstates[
                                                                    index]
                                                                .info!
                                                                .images!
                                                                .isEmpty
                                                            ? const AssetImage(
                                                                'assets/images/logo.jpg')
                                                            : FileImage(File(
                                                                showEstates[
                                                                        index]
                                                                    .info!
                                                                    .images![0])),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20.r)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            (20.w).pw,
                                            Obx(() => FadeInLeft(
                                                  delay: Duration(
                                                      milliseconds:
                                                          400 * (index + 1)),
                                                  duration: const Duration(
                                                      milliseconds: 400),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            width: 110.w,
                                                            child: CustomRowEstateInfo(
                                                                title:
                                                                    'رقم العرض: ',
                                                                body: showEstates[
                                                                        index]
                                                                    .numberView
                                                                    .toString()),
                                                          ),
                                                          (25.h).ph,
                                                          SizedBox(
                                                            width: 110.w,
                                                            child: CustomRowEstateInfo(
                                                                title:
                                                                    'السعر: ',
                                                                body: showEstates[
                                                                        index]
                                                                    .price
                                                                    .toString()),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        height: 80.h,
                                                        color: AppColors
                                                            .mainColor
                                                            .withOpacity(0.6),
                                                        width: 2.w,
                                                        margin: EdgeInsets.only(
                                                            left: 10.w,
                                                            right: 10.h,
                                                            bottom: 10.h),
                                                      ),
                                                      (10.w).pw,
                                                      Column(
                                                        textDirection:
                                                            TextDirection.rtl,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            width: 140.w,
                                                            child: CustomRowEstateInfo(
                                                                title:
                                                                    'المساحة: ',
                                                                body: showEstates[
                                                                        index]
                                                                    .space
                                                                    .toString()),
                                                          ),
                                                          (25.h).ph,
                                                          SizedBox(
                                                            width: 140.w,
                                                            child: CustomRowEstateInfo(
                                                                title: estateType ==
                                                                        'أرض'
                                                                    ? 'مزروعة: '
                                                                    : 'الاكساء: ',
                                                                body: estateType ==
                                                                        'أرض'
                                                                    ? (showEstates[index]
                                                                                .info!
                                                                                .landInfo!
                                                                                .planted ==
                                                                            true
                                                                        ? 'نعم'
                                                                        : 'لا')
                                                                    : (estateType ==
                                                                            'شقة'
                                                                        ? showEstates[index]
                                                                            .info!
                                                                            .apartmentInfo!
                                                                            .apartmentType!
                                                                        : showEstates[index]
                                                                            .info!
                                                                            .shopInfoModel!
                                                                            .shopType!)),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                      FadeInUp(
                                        delay: Duration(
                                            milliseconds: 400 * (index + 1)),
                                        duration:
                                            const Duration(milliseconds: 400),
                                        child: IntrinsicWidth(
                                          child: Container(
                                            constraints:
                                                BoxConstraints(minWidth: 100.w),
                                            margin:
                                                EdgeInsets.only(right: 80.w),
                                            height: 30.h,
                                            padding: EdgeInsets.only(
                                                left: 10.w, right: 10.w),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: AppColors.mainColor,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(16.r),
                                                    topRight:
                                                        Radius.circular(16.r)),
                                                border: Border(
                                                    top: BorderSide(
                                                        color: AppColors
                                                            .mainColor),
                                                    left: BorderSide(
                                                        color: AppColors
                                                            .mainColor),
                                                    right: BorderSide(
                                                        color: AppColors
                                                            .mainColor))),
                                            child: CustomText(
                                              text:
                                                  showEstates[index].location!,
                                              textType: TextStyleType.body,
                                              textColor: AppColors.whiteColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 80.w,
                                          height: 40.w,
                                          decoration: BoxDecoration(
                                              color: AppColors.whiteColor,
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(20.r),
                                                  topLeft:
                                                      Radius.circular(20.r)),
                                              border: Border.all(
                                                  color: AppColors.mainColor)),
                                          child: CustomText(
                                            text:
                                                showEstates[index].estateState!,
                                            textType: TextStyleType.small,
                                            textColor: AppColors.redColor
                                                .withOpacity(0.7),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    )
            ],
          ),
        ));
  }
}
