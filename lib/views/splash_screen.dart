import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pill_box/helper/app_images.dart';
import 'package:pill_box/helper/route_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      GoRouter.of(context).goNamed(RouteConstant.selectLoginScreen);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(AppImages.logo)),
    );
  }
}
