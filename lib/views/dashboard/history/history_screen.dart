import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pill_box/helper/app_images.dart';
import 'package:pill_box/helper/app_styles.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pill_box/widgets/pills_tile.dart';

import '../../../helper/app_colors.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    final key1 = UniqueKey();
    final key2 = UniqueKey();
    final key3 = UniqueKey();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.h),
                child: Row(
                  children: [
                    Text(
                      "Thursday",
                      style:
                          AppStyles.extraBoldStyle!.copyWith(fontSize: 25.sp),
                    ),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              ),
              Container(
                width: screenWidth,
                decoration: BoxDecoration(
                    border: Border.all(width: .5, color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.r)),
                padding: EdgeInsets.fromLTRB(15.h, 15.h, 0, 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: screenWidth * .5,
                            child: Text(
                              "Your plan is almost done!",
                              style: AppStyles.extraBoldStyle!
                                  .copyWith(fontSize: 20.sp),
                            ),
                          ),
                          Text(
                            "13% than weak ago",
                            style:
                                AppStyles.basicStyle!.copyWith(fontSize: 16.sp),
                          ),
                        ]),
                    Expanded(
                      child: CircularPercentIndicator(
                        radius: 50.0,
                        lineWidth: 10.0,
                        animation: true,
                        percent: .78,
                        circularStrokeCap: CircularStrokeCap.round,
                        center: Text(
                          "78%",
                          style: AppStyles.extraBoldStyle!
                              .copyWith(color: AppColors.primaryColor),
                        ),
                        progressColor: AppColors.primaryColor,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Stack(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(25.r)),
                      width: screenWidth,
                      height: screenHeight * .13,
                      child: Image.asset(
                        AppImages.historyGradient,
                        fit: BoxFit.fill,
                      )),
                  Positioned(
                    left: 15,
                    top: screenHeight * .042,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Get Vaccinated",
                            style: AppStyles.extraBoldStyle!.copyWith(
                                color: Colors.white, fontSize: 20.sp)),
                        Text("Nearest Vaccination Center",
                            style: AppStyles.boldStyle!.copyWith(
                                color: Colors.white, fontSize: 16.sp)),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 10,
                      child: Image.asset(
                        AppImages.vaccine,
                        fit: BoxFit.cover,
                        height: screenHeight * .15,
                      ))
                ],
              ),
              SizedBox(height: 20.h),
              Text("8:00", style: AppStyles.boldStyle),
              SizedBox(height: 20.h),
              Slidable(
                key: key1,
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  extentRatio: .3,
                  children: [
                    Container(
                      height: screenHeight,
                      width: screenWidth * .2,
                      decoration: BoxDecoration(
                          border: Border.all(width: .5, color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.fromLTRB(5, 10, 2, 10),
                      child: Icon(Icons.done),
                    ),
                  ],
                ),
                endActionPane: null,
                child: PillsTile(
                    image: AppImages.capsule,
                    title: "Omega 3",
                    subtitle: "1 tablet after meal",
                    trailing: "7 days"),
              ),
              SizedBox(height: 20.h),
              Slidable(
                key: key2,
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  extentRatio: .3,
                  children: [
                    Container(
                      height: screenHeight,
                      width: screenWidth * .2,
                      decoration: BoxDecoration(
                          border: Border.all(width: .5, color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.fromLTRB(5, 10, 2, 10),
                      child: Icon(Icons.done),
                    ),
                  ],
                ),
                endActionPane: null,
                child: PillsTile(
                    image: AppImages.tablet,
                    title: "Comlivit",
                    subtitle: "1 tablet after meal",
                    trailing: "7 days"),
              ),
              SizedBox(height: 20.h),
              Slidable(
                key: key3,
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  extentRatio: .3,
                  children: [
                    Container(
                      height: screenHeight,
                      width: screenWidth * .2,
                      decoration: BoxDecoration(
                          border: Border.all(width: .5, color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.fromLTRB(5, 10, 2, 10),
                      child: Icon(Icons.done),
                    ),
                  ],
                ),
                endActionPane: null,
                child: PillsTile(
                    image: AppImages.htp,
                    title: "5-HTP",
                    subtitle: "1 ampoule",
                    trailing: "2 days"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
