import 'package:argb_app/core/general_util.dart';
import 'package:argb_app/ui/views/splash_screen_view/splash_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(540, 960),
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: false,
      child: GetMaterialApp(
        defaultTransition: GetPlatform.isAndroid
            ? Transition.leftToRight
            : Transition.cupertino,
        transitionDuration: const Duration(microseconds: 300),
        debugShowCheckedModeBanner: false,
        title: 'Internship Pakistan',
        onReady: () {
        myAppController.checkDevice();
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreenView(),
      ),
    );
  }
}
