import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pill_box/helper/app_images.dart';
import 'package:pill_box/helper/route_constant.dart';

import '../../helper/app_colors.dart';
import '../../helper/app_fonts.dart';
import '../../helper/app_styles.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  constraints: BoxConstraints(
                    maxHeight: screenHeight * .88,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Sign up",
                        style: TextStyle(
                            fontFamily: AppFonts.gilroyBold, fontSize: 25.sp),
                      ),
                      SizedBox(height: 25.h),
                      AppTextFiled(
                        headText: "First Name",
                        hintText: "Your First Name",
                        controller: firstNameController,
                      ),
                      SizedBox(height: 20.h),
                      AppTextFiled(
                        headText: "Last Name",
                        hintText: "Your Last Name",
                        controller: lastNameController,
                      ),
                      SizedBox(height: 20.h),
                      AppTextFiled(
                        headText: "E-mail",
                        hintText: "Your Email",
                        controller: emailController,
                        icon: AppImages.mailIcon,
                      ),
                      SizedBox(height: 20.h),
                      AppTextFiled(
                        headText: "Password",
                        hintText: "Your Password",
                        isPassword: true,
                        controller: passwordController,
                        icon: AppImages.lockIcon,
                      ),
                      SizedBox(height: 10.h),
                      RichText(
                          text: TextSpan(
                              text: "By signing up you agree to our ",
                              style: AppStyles.basicStyle!
                                  .copyWith(color: Colors.grey),
                              children: [
                            TextSpan(
                                text: "Terms & Conditions ",
                                style: AppStyles.basicStyle!
                                    .copyWith(color: Colors.black)),
                            TextSpan(
                              text: "and ",
                            ),
                            TextSpan(
                                text: "Privacy Policy.",
                                style: AppStyles.basicStyle!
                                    .copyWith(color: Colors.black)),
                            TextSpan(
                                text: "*",
                                style: AppStyles.basicStyle!
                                    .copyWith(color: Colors.red)),
                          ])),
                      SizedBox(height: 30.h),
                      AppButton(
                          height: 50.h,
                          width: screenWidth * .9,
                          text: "Continue",
                          onPressed: () {
                            GoRouter.of(context).pushNamed(
                                RouteConstant.otpScreen,
                                extra: "abc@gmail.com");
                          }),
                    ],
                  ),
                ),
                RichText(
                    text: TextSpan(
                        text: "Already signed up? ",
                        style:
                            AppStyles.basicStyle!.copyWith(color: Colors.grey),
                        children: [
                      TextSpan(
                          text: "Login",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              GoRouter.of(context).pop();
                            },
                          style: AppStyles.boldStyle!
                              .copyWith(color: AppColors.primaryColor))
                    ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
