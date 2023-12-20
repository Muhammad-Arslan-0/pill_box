import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pill_box/helper/app_fonts.dart';
import 'package:pill_box/helper/route_constant.dart';
import 'package:pill_box/widgets/app_button.dart';

class SelectLoginScreen extends StatelessWidget {
  const SelectLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
                height: 50.h,
                width: screenWidth * .8,
                fontFamily: AppFonts.asapCondensed,
                onPressed: () {
                  GoRouter.of(context).pushNamed(RouteConstant.loginScreen);
                },
                text: "Login"),
            SizedBox(height: 20.h),
            AppButton(
                height: 50.h,
                width: screenWidth * .8,
                isOutline: true,
                onPressed: () {
                  GoRouter.of(context).pushNamed(RouteConstant.signUpScreen);
                },
                fontFamily: AppFonts.asapCondensed,
                text: "Register")
          ],
        ),
      ),
    );
  }
}
