import 'package:argb_app/app/my_app.dart';
import 'package:argb_app/app/my_app_controller.dart';
import 'package:argb_app/core/general_util.dart';
import 'package:argb_app/core/repositories/hive_repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  Get.put(HiveRepository());
  await storage.init();
  storage.registerAdapter();
  Get.put(MyAppController());
  runApp(const MyApp());
}
