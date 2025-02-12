import 'package:argb_app/core/general_util.dart';
import 'package:argb_app/core/model2/estate_model.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_show_snackbar.dart';
import 'package:argb_app/ui/views/estate_type_view/estate_type_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:get/get.dart';

class ShopController extends GetxController {
  late CarouselController buttonCarouselController = CarouselController();
  SwipeActionController swipeActionController = SwipeActionController();
  List<EstateModel> allEstates = <EstateModel>[];
  RxList<EstateModel> showEstates = <EstateModel>[].obs;
  List<String> shopType = ['الكل', 'على العضم', 'جاهز'];
  List<String> estateState = ['للبيع', 'للإيجار'];
  int selectedImageIndex = 0;
  int currentApartType = 0;

  onPageChanged1(int index, _) {
    selectedImageIndex = index;
  }

  initListFilterShop() {
    if (allEstates.isNotEmpty) {
      if (currentApartType == 0) {
        showEstates.value = allEstates.obs;
      } else if (currentApartType == 1) {
        showEstates.value = allEstates.where((shop) {
          return shop.info!.shopInfoModel!.shopType == shopType[1];
        }).toList();
      } else if (currentApartType == 2) {
        showEstates.value = allEstates.where((shop) {
          return shop.info!.shopInfoModel!.shopType == shopType[2];
        }).toList();
      }
      update();
    }
  }

  addShop({required EstateModel estate}) async {
    allEstates.add(estate);
    await storage.setShops(allEstates).then((c) async {
      await storage.closeBox(boxName: storage.boxShop).then((s) async {
        await handleShowData();
      });
    });
    showSnackBar(title: 'تم أضافة العقار بنجاح');
    update();
    EstateTypeController estateTypeController = Get.find();
    await Future.delayed(const Duration(milliseconds: 700), () {
      Get.back(closeOverlays: true);
      estateTypeController.clearDataField();
    });
  }

  removeShop({required int numberView}) {
    allEstates.removeWhere((es) {
      return es.numberView == numberView;
    });
    storage.setShops(allEstates);
    showEstates.removeWhere((es) {
      return es.numberView == numberView;
    });
    update();
  }

  Future handleShowData() async {
    await storage.initEstate(nameKey: storage.shops).then((s) {
      allEstates = storage.getShops().cast<EstateModel>();
      showEstates.value = allEstates.obs;
      update();
    });
  }

  @override
  Future<void> onInit() async {
    await handleShowData();
    super.onInit();
  }

  @override
  Future<void> onClose() async {
    await storage.closeBox(boxName: storage.boxShop);
    // TODO: implement onClose
    super.onClose();
  }
}
