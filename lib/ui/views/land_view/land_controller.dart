import 'package:argb_app/core/general_util.dart';
import 'package:argb_app/core/model2/estate_model.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_show_snackbar.dart';
import 'package:argb_app/ui/views/estate_type_view/estate_type_controller.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:get/get.dart';

class LandController extends GetxController {
  List<EstateModel> allEstates = <EstateModel>[];
  SwipeActionController swipeActionController = SwipeActionController();

  addLand({required EstateModel estate}) async {
    allEstates.add(estate);
    await storage.setLands(allEstates).then((c) async {
      await storage.closeBox(boxName: storage.boxLand).then((s) async {
        await handleShowData();
      });

    });
    showSnackBar(title: 'تم أضافة العقار بنجاح');
    update();
    EstateTypeController estateTypeController = Get.find();
    await Future.delayed(const Duration(seconds: 1), () {
      Get.back(closeOverlays: true);
      estateTypeController.clearDataField();
    });
  }

  removeLand({required int numberView}) {
    allEstates.removeWhere((es) {
      return es.numberView == numberView;
    });
    storage.setLands(allEstates);
    update();
  }

  Future handleShowData() async {
    await storage.initEstate(nameKey: storage.lands).then((s) {
      allEstates = storage.getLands().cast<EstateModel>();
      update();
    });
  }

  @override
  void onInit() {
    handleShowData();
    super.onInit();
  }

  @override
  Future<void> onClose() async {
    await storage.closeBox(boxName: storage.boxLand);
    // TODO: implement onClose
    super.onClose();
  }
}
