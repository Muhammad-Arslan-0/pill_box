import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_box/helper/app_colors.dart';
import 'package:pill_box/helper/app_fonts.dart';

class AppButton extends StatelessWidget {
  final double height;
  final double width;
  final bool isOutline;
  final String fontFamily;
  final String text;
  final Function() onPressed;

  const AppButton(
      {super.key,
      required this.height,
      required this.width,
      required this.text,
      required this.onPressed,
      this.isOutline = false,
      this.fontFamily = AppFonts.gilroy});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                side: isOutline
                    ? BorderSide(color: AppColors.primaryColor, width: 2)
                    : null,
                backgroundColor:
                    isOutline ? Colors.transparent : AppColors.primaryColor,
                elevation: isOutline ? 0 : null,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: isOutline ? AppColors.primaryColor : null),
            )));
  }
}
