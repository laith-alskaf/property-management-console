import 'package:argb_app/ui/shared/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomRowEstateInfo extends StatelessWidget {
  const CustomRowEstateInfo(
      {super.key,
      required this.title,
      required this.body,
      this.fontSize,
      this.isEstateInfoView});

  final String title;
  final String body;
  final double? fontSize;
  final bool? isEstateInfoView;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: isEstateInfoView ?? false
          ? MainAxisAlignment.spaceEvenly
          : MainAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          textType: TextStyleType.small,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          maxLines: 1,
        ),
        CustomText(
          text: body,
          fontSize: fontSize,
          textType: TextStyleType.small,
          maxLines: 1,
        ),
      ],
    );
  }
}
