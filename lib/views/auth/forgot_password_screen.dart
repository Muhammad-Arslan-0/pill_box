import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pill_box/helper/app_styles.dart';

import '../../helper/app_colors.dart';
import '../../helper/app_fonts.dart';
import '../../helper/app_images.dart';
import '../../helper/route_constant.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: screenHeight * .88),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                          fontFamily: AppFonts.gilroyBold, fontSize: 25.sp),
                    ),
                    SizedBox(height: 40.h),
                    Text(
                      "Please Enter Your Registered email address, so we will send you link to your email",
                      style: AppStyles.basicStyle,
                    ),
                    SizedBox(height: 20.h),
                    AppTextFiled(
                      headText: "E-mail",
                      hintText: "Your Email",
                      icon: AppImages.mailIcon,
                      controller: emailController,
                    ),
                    SizedBox(height: 40.h),
                    AppButton(
                        height: 50.h,
                        width: screenWidth * .9,
                        text: "Send Reset Instruction",
                        onPressed: () {
                          GoRouter.of(context).pop();
                        }),
                  ],
                ),
              ),
              RichText(
                  text: TextSpan(
                      text: "Don't have an account? ",
                      style: AppStyles.basicStyle!.copyWith(color: Colors.grey),
                      children: [
                    TextSpan(
                        text: "Signup",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            GoRouter.of(context)
                                .pushNamed(RouteConstant.signUpScreen);
                          },
                        style: AppStyles.boldStyle!
                            .copyWith(color: AppColors.primaryColor))
                  ])),
            ],
          ),
        ),
      ),
    ));
  }
}
