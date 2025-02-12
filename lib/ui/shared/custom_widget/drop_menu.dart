import 'package:argb_app/ui/shared/colors.dart';
import 'package:argb_app/ui/shared/custom_widget/custom_text.dart';
import 'package:argb_app/ui/shared/extension_sizebox.dart';
import 'package:argb_app/ui/views/estate_type_view/estate_type_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DropMenuJob extends StatelessWidget {
  DropMenuJob(
      {super.key,
      required this.items,
      this.onSaved,
      this.validator,
      required this.messageError, this.value});

  EstateTypeController controller = Get.find();
  final List<String> items;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String messageError;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SizedBox(
          height: 50.h,
          child: DropdownButtonFormField2<String>(
            value:value ,
            style: TextStyle(color: AppColors.mainColor),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.blackColor.withOpacity(0.02),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.mainColor)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.mainColor)),
              border: const UnderlineInputBorder(),
            ),
            items: items.map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem<String>(
                alignment: Alignment.center,
                value: value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      text: value,
                      textColor: AppColors.blackColor,
                      textType: TextStyleType.body,
                      fontWeight: FontWeight.normal,
                    ),
                    Visibility(
                      visible: items.last != value,
                      child: const Divider(
                        color: AppColors.blackColor,
                        indent: 10.0,
                        endIndent: 10.0,
                      ),
                    ),
                    if (items.last != value) (2.h).ph,
                  ],
                ),
              );
            }).toList(),
            selectedItemBuilder: (BuildContext context) {
              return items.map<Widget>((String value) {
                return CustomText(
                  text: value,
                  textType: TextStyleType.body,
                  fontWeight: FontWeight.normal,
                );
              }).toList();
            },
            validator: (value) {
              if (value == null) {
                return messageError;
              }
              return null;
            },
            onChanged: onSaved,
            onSaved: onSaved,
            // onSaved: (value) {
            //   controller.job.text = value!;
            // },
            iconStyleData: const IconStyleData(
              iconSize: 0,
            ),
            dropdownStyleData: DropdownStyleData(
              direction: DropdownDirection.left,
              maxHeight: 200.h,
              width: 0.3.sw,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            menuItemStyleData: MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            ),
          ),
        ),
      ),
    );
  }
}
