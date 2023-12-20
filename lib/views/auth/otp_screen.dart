import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_box/helper/app_styles.dart';
import 'package:pill_box/widgets/app_button.dart';
import 'package:pinput/pinput.dart';

import '../../helper/app_colors.dart';
import '../../helper/app_fonts.dart';

class OtpScreen extends StatelessWidget {
  final String email;
  const OtpScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(height: 20.h),
                Text(
                  "Check your Mail",
                  style: TextStyle(
                      fontFamily: AppFonts.gilroyBold, fontSize: 25.sp),
                ),
                SizedBox(height: 20.h),
                RichText(
                  text: TextSpan(
                      text: "We've sent a 6-digit confirmation code to ",
                      style:
                          AppStyles.basicStyle!.copyWith(color: Colors.black),
                      children: [
                        TextSpan(text: "$email.", style: AppStyles.boldStyle),
                        TextSpan(text: " Make sure you enter correct code")
                      ]),
                ),
                SizedBox(height: 50.h),
                Pinput(
                  length: 6,
                  obscureText: false,
                ),
                SizedBox(height: 50.h),
                AppButton(
                    height: 45.h,
                    width: screenWidth,
                    text: "Verify",
                    onPressed: () {}),
              ]),
              RichText(
                  text: TextSpan(
                      text: "Didn't receive code? ",
                      style: AppStyles.basicStyle!.copyWith(color: Colors.grey),
                      children: [
                    TextSpan(
                        text: "Resend Code",
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: AppStyles.boldStyle!
                            .copyWith(color: AppColors.primaryColor))
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
