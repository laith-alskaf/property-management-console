
import 'package:argb_app/app/my_app_controller.dart';
import 'package:argb_app/core/repositories/hive_repositories.dart';
import 'package:get/get.dart';

HiveRepository get storage => Get.find<HiveRepository>();

MyAppController get myAppController => Get.find<MyAppController>();