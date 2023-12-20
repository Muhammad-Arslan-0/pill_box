import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pill_box/helper/app_colors.dart';
import 'package:pill_box/helper/app_fonts.dart';
import 'package:pill_box/helper/app_images.dart';
import 'package:pill_box/helper/app_styles.dart';
import 'package:pill_box/helper/route_constant.dart';
import 'package:pill_box/provider/auth_provider.dart';
import 'package:pill_box/widgets/app_button.dart';
import 'package:pill_box/widgets/social_login_button.dart';

import '../../widgets/app_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final changeNotifierProvider =
        ChangeNotifierProvider((ref) => AuthProvider());
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
                        "Login",
                        style: TextStyle(
                            fontFamily: AppFonts.gilroyBold, fontSize: 25.sp),
                      ),
                      SizedBox(height: 40.h),
                      AppTextFiled(
                        headText: "E-mail",
                        hintText: "Your Email",
                        icon: AppImages.mailIcon,
                        controller: emailController,
                      ),
                      SizedBox(height: 20.h),
                      AppTextFiled(
                        headText: "Password",
                        hintText: "Your Password",
                        icon: AppImages.lockIcon,
                        isPassword: true,
                        controller: passwordController,
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Consumer(builder: (context, ref, child) {
                                return Checkbox(
                                    activeColor: AppColors.primaryColor,
                                    value: ref
                                        .watch(changeNotifierProvider.notifier)
                                        .isRemembered,
                                    onChanged: (v) {
                                      ref
                                          .watch(changeNotifierProvider)
                                          .changeCheckBox(v ?? false);
                                    });
                              }),
                              SizedBox(width: 2),
                              Text("Remember Me", style: AppStyles.basicStyle)
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              GoRouter.of(context).pushNamed(
                                  RouteConstant.forgotPasswordScreen);
                            },
                            child: Text("Forgot Password?",
                                style: AppStyles.basicStyle!
                                    .copyWith(color: AppColors.primaryColor)),
                          )
                        ],
                      ),
                      SizedBox(height: 40.h),
                      AppButton(
                          height: 50.h,
                          width: screenWidth * .9,
                          text: "Login",
                          onPressed: () {
                            GoRouter.of(context)
                                .pushNamed(RouteConstant.dashBoardScreen);
                          }),
                      SizedBox(height: 30.h),
                      Row(
                        children: [
                          Expanded(child: Divider(thickness: 2)),
                          Padding(
                            padding: EdgeInsets.all(10.h),
                            child: Text(
                              "or continue with",
                              style: AppStyles.basicStyle,
                            ),
                          ),
                          Expanded(child: Divider(thickness: 2))
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Center(
                        child: SizedBox(
                          width: screenWidth * .6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SocialLoginButton(
                                  image: AppImages.facebook, onTap: () {}),
                              SocialLoginButton(
                                  image: AppImages.google, onTap: () {}),
                              SocialLoginButton(
                                  image: AppImages.linkedin, onTap: () {}),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                    text: TextSpan(
                        text: "Don't have an account? ",
                        style:
                            AppStyles.basicStyle!.copyWith(color: Colors.grey),
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
      ),
    );
  }
}
