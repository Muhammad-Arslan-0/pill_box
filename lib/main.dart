import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_box/helper/app_colors.dart';
import 'package:pill_box/helper/app_fonts.dart';
import 'package:pill_box/route/app_router.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Pill Box',
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                  seedColor: AppColors.primaryColor,
                  brightness: Brightness.light),
              primaryColor: AppColors.primaryColor,
              useMaterial3: false,
              fontFamily: AppFonts.gilroy),
          routerDelegate: AppRouter.router.routerDelegate,
          routeInformationProvider: AppRouter.router.routeInformationProvider,
          routeInformationParser: AppRouter.router.routeInformationParser,
        );
      },
    );
  }
}
