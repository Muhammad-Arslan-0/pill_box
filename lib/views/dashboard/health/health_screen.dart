import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pill_box/helper/app_colors.dart';
import 'package:pill_box/helper/app_images.dart';
import 'package:pill_box/helper/app_styles.dart';
import 'package:pill_box/helper/route_constant.dart';
import 'package:pill_box/model/health_model.dart';

class HealthScreen extends StatelessWidget {
  HealthScreen({super.key});
  final List<HealthModel> items = [
    HealthModel(
        img: AppImages.heartRate,
        text: "Heart Rate",
        screen: RouteConstant.heartRateScreen),
    HealthModel(
        img: AppImages.bloodPressure,
        text: "Blood Pressure",
        screen: RouteConstant.heartRateScreen),
    HealthModel(
        img: AppImages.sleepTracker,
        text: "Sleep Tracker",
        screen: RouteConstant.heartRateScreen),
    HealthModel(
        img: AppImages.pillReminder,
        text: "Pill Reminder",
        screen: RouteConstant.heartRateScreen),
    HealthModel(
        img: AppImages.period,
        text: "Period",
        screen: RouteConstant.periodScreen),
    HealthModel(
        img: AppImages.pregnancy,
        text: "Pregnancy",
        screen: RouteConstant.pregnancyScreen),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.1),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final HealthModel model = items[index];
            return Padding(
              padding: EdgeInsets.all(10.h),
              child: InkWell(
                borderRadius: BorderRadius.circular(30.r),
                splashColor: AppColors.primaryColor,
                onTap: () {
                  GoRouter.of(context).pushNamed(model.screen);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      border:
                          Border.all(width: 2, color: AppColors.primaryColor),
                      gradient: LinearGradient(
                          colors: [
                            AppColors.primaryColor.withOpacity(.2),
                            Colors.white,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(model.img),
                        Padding(
                          padding: EdgeInsets.all(8.h),
                          child: Text(
                            model.text,
                            style: AppStyles.boldStyle!.copyWith(
                                color: AppColors.primaryColor, fontSize: 18.sp),
                          ),
                        )
                      ]),
                ),
              ),
            );
          }),
    );
  }
}
