import 'dart:io';
import 'package:argb_app/core/general_util.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_show_snackbar.dart';
import 'package:argb_app/ui/views/estate_type_view/estate_type_view.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  validateDeviceId() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (myAppController.deviceId == 'QKQ1.190910.002') {
        showSnackBar(title: 'اهلا بك سيد العراب للعقارات', seconds: 3);
        Get.offAll(() => EstateTypeView());
      } else {
        showSnackBar(
            title:
                'هذا التطبيق خاص بالعراب للعقارات فقط  لتشغيله يرجى التواصل على الرقم 0982055788',
            seconds: 4,
            milliseconds: 500);
        Future.delayed(const Duration(seconds: 5)).then((value) {
          exit(0);
        });
      }
    });
  }

  @override
  void onInit() {
    validateDeviceId();
    super.onInit();
  }
}
