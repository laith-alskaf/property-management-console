import 'package:argb_app/core/model2/estate_model.dart';
import 'package:device_info_plus/device_info_plus.dart';
// import 'package:device_info_plus/device_info_plus.dart';

// import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
// import 'package:mobile_device_identifier/mobile_device_identifier.dart';

class MyAppController extends GetxController {
  List<String> estateType = ['شقة', 'محل', 'أرض'];

  late List<EstateModel> apartments;
  late List<EstateModel> lands;
  late String deviceId;

  checkDevice() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceId = androidInfo.id;
  }
}
