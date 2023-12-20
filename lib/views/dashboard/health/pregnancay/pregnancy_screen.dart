import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pill_box/helper/app_colors.dart';
import 'package:pill_box/helper/app_images.dart';
import 'package:pill_box/helper/app_styles.dart';
import 'package:pill_box/widgets/header_widget.dart';

class PregnancyScreen extends StatelessWidget {
  const PregnancyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(120.h), child: HeaderWidget()),
        body: Stack(
          children: [
            Container(
              height: screenHeight,
              width: screenWidth,
              padding: EdgeInsets.fromLTRB(20.h, 20.h, 20.h, 0),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                AppColors.primaryColor.withOpacity(.6),
                Colors.white
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(AppImages.menuIcon),
                        Text(
                          "November",
                          style: AppStyles.extraBoldStyle!
                              .copyWith(fontSize: 20.sp),
                        ),
                        Row(
                          children: [
                            Icon(Icons.arrow_back),
                            SizedBox(width: 15.w),
                            Icon(Icons.arrow_forward)
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Container(
                        padding: EdgeInsets.all(10.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white),
                        child: TabBar(
                          dividerColor: Colors.transparent,
                          labelColor: Colors.white,
                          unselectedLabelStyle: AppStyles.basicStyle,
                          labelStyle: AppStyles.boldStyle,
                          unselectedLabelColor: Colors.black,
                          indicator: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(100.r)),
                          tabs: const [
                            Tab(text: "Weekly"),
                            Tab(text: "Monthly"),
                            Tab(text: "Yearly"),
                          ],
                        )),
                    SizedBox(height: 10.h),
                    SizedBox(
                        height: screenHeight * .1,
                        width: screenWidth,
                        child: TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            ListView.builder(
                                itemCount: 30,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final bool isSelected = index == 8;
                                  return Row(
                                    children: [
                                      Container(
                                        padding: isSelected
                                            ? EdgeInsets.symmetric(
                                                vertical: 20.h,
                                                horizontal: 15.w)
                                            : EdgeInsets.all(0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            color: isSelected
                                                ? AppColors.primaryColor
                                                : Colors.transparent),
                                        child: Text("${index + 1}",
                                            style: isSelected
                                                ? AppStyles.boldStyle!.copyWith(
                                                    color: Colors.white)
                                                : AppStyles.boldStyle),
                                      ),
                                      if (index != 29) SizedBox(width: 20.w)
                                    ],
                                  );
                                }),
                            Center(child: Text("Monthly")),
                            Center(child: Text("Yearly")),
                          ],
                        )),
                    Stack(
                      children: [
                        Container(
                          width: screenWidth,
                          height: screenHeight * .4,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                focal: Alignment.topCenter,
                                colors: [
                                  AppColors.primaryColor.withOpacity(.2),
                                  Colors.blueGrey.withOpacity(.1),
                                ],
                              )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Week 42",
                                style: AppStyles.extraBoldStyle!
                                    .copyWith(fontSize: 20.sp),
                              ),
                              Text("Day 6",
                                  style: AppStyles.extraBoldStyle!
                                      .copyWith(fontSize: 16.sp)),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                padding: EdgeInsets.all(10.h),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      AppColors.primaryColor.withOpacity(.2),
                                      Colors.white
                                    ]),
                                    shape: BoxShape.circle),
                                child: SvgPicture.asset(AppImages.settingIcon)),
                            Container(
                                padding: EdgeInsets.all(10.h),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      AppColors.primaryColor.withOpacity(.2),
                                      Colors.white
                                    ]),
                                    shape: BoxShape.circle),
                                child: SvgPicture.asset(AppImages.plusOne)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    FloatingActionButton(
                        backgroundColor: AppColors.primaryColor,
                        onPressed: () {},
                        child: Icon(Icons.add)),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(AppImages.p1),
                        SvgPicture.asset(AppImages.p2),
                        SvgPicture.asset(AppImages.p3),
                        SvgPicture.asset(AppImages.p4),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
