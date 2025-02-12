import 'dart:io';
import 'package:argb_app/ui/shared/colors.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';

class HeroPhotoViewRouteWrapper extends StatelessWidget {
  const HeroPhotoViewRouteWrapper({
    super.key,
    required this.imageProvider,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
  });

  final List<String> imageProvider;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Expanded(
              child: ListView(
                children: List.generate(imageProvider.length, (index) {
                  return Container(
                    constraints: BoxConstraints.expand(
                      height: MediaQuery.of(context).size.height,
                    ),
                    child: PhotoView(
                      imageProvider:  FileImage(File(imageProvider[index])),
                      backgroundDecoration: backgroundDecoration,
                      minScale: minScale,
                      maxScale: maxScale,
                    ),
                  );
                }),
              ),
            ),
            if (imageProvider.length > 1)
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                          text: 'اسحب للأسفل',
                          textType: TextStyleType.bodyBig,
                          textColor: AppColors.mainColor,
                        ),
                        Icon(
                          Icons.arrow_downward_sharp,
                          size: 80.w,
                          color: AppColors.mainColor,
                        ),
                      ],
                    ),
                  ))
          ],
        ),
      ),
    );
  }
}
