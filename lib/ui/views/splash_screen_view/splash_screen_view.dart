import 'package:argb_app/ui/views/splash_screen_view/splash_screen_controller.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Stack(
      children: [
        Container(
          height: 1.sh,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.cover)),
        ),
        Positioned(bottom: 30.h,
          left: 0.39.sw,
          child: ZoomIn(
            duration: const Duration(milliseconds: 600),
            delay: const Duration(milliseconds: 500),
            child: SpinKitThreeBounce(
              color: Colors.yellow.withOpacity(0.4),
            ),
          ),
        ),
      ],
    );
  }
}
