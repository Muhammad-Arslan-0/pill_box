import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pill_box/helper/app_images.dart';
import 'package:pill_box/helper/app_styles.dart';
import 'package:pill_box/widgets/header_widget.dart';

import '../../../../helper/app_colors.dart';

class PeriodScreen extends StatelessWidget {
  const PeriodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(120.h), child: HeaderWidget()),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.h),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * .06,
                  child: TabBar(
                      unselectedLabelColor: AppColors.primaryColor,
                      indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 5,
                                color: AppColors.primaryColor.withOpacity(.1),
                                blurRadius: 5,
                                offset: Offset(0, 5))
                          ],
                          border: Border.all(
                              width: 2, color: AppColors.primaryColor)),
                      labelColor: AppColors.primaryColor,
                      tabs: const [
                        Tab(
                          child: Row(
                            children: [
                              Flexible(child: Icon(Icons.home)),
                              FittedBox(child: Text("My Cycle"))
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            children: [
                              Flexible(
                                  child: Icon(Icons.calendar_month_outlined)),
                              FittedBox(child: Text("Calender"))
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            children: [
                              Flexible(
                                  child: Icon(Icons.sticky_note_2_outlined)),
                              FittedBox(child: Text("Stories"))
                            ],
                          ),
                        )
                      ]),
                ),
                SizedBox(height: 10.h),
                Expanded(
                    child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomPaint(
                              painter: Painter(),
                              willChange: true,
                              size: Size(screenWidth, screenHeight * .12),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: screenHeight * .06,
                                        horizontal: screenWidth * .08),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("18 December",
                                                style: AppStyles.boldStyle!
                                                    .copyWith(
                                                        color: Colors.white)),
                                            Text("Last period date",
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Colors.white70)),
                                          ],
                                        ),
                                        Container(
                                          width: 1.2,
                                          height: screenHeight * .04,
                                          color: Colors.white,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("19 January",
                                                style: AppStyles.boldStyle!
                                                    .copyWith(
                                                        color: Colors.white)),
                                            Text("Next period date",
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Colors.white70)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                      left: screenWidth * .4,
                                      right: screenWidth * .4,
                                      child: Image.asset(AppImages.drop))
                                ],
                              ),
                            ),
                            Image.asset(AppImages.periodDate),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.r),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(.3),
                                          blurRadius: 10,
                                          spreadRadius: 6,
                                          offset: Offset(0, 3))
                                    ]),
                                padding: EdgeInsets.all(10.h),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.add_circle,
                                        color: AppColors.primaryColor),
                                    SizedBox(width: 10.h),
                                    Text(
                                      "Period Logs",
                                      style: AppStyles.boldStyle!.copyWith(
                                          color: AppColors.primaryColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: const [
                                        Color(0xffFFE8E8),
                                        Color(0xffFFCECE),
                                      ]),
                                  borderRadius: BorderRadius.circular(10.r)),
                              padding: EdgeInsets.all(15.h),
                              margin: EdgeInsets.all(10.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AppImages.timelapse),
                                  SizedBox(width: 10.w),
                                  Text(
                                    "Period overdue by 4 day",
                                    style: AppStyles.boldStyle!
                                        .copyWith(color: Color(0xffFF8D8D)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r)),
                              padding: EdgeInsets.all(10.h),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(AppImages.psIcon),
                                        SizedBox(width: 10),
                                        Text(
                                          "Have your period started?",
                                          style: AppStyles.extraBoldStyle,
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Color(0xffF0E9FF),
                                            borderRadius:
                                                BorderRadius.circular(100.r)),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.h, horizontal: 20.w),
                                        child: Text(
                                          "Yes",
                                          style: AppStyles.boldStyle!.copyWith(
                                              color: AppColors.primaryColor),
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Color(0xffF0E9FF),
                                            borderRadius:
                                                BorderRadius.circular(100.r)),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.h, horizontal: 20.w),
                                        child: Text(
                                          "No, Ask me later",
                                          style: AppStyles.boldStyle!.copyWith(
                                              color: AppColors.primaryColor),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ]),
                    ),
                    Center(child: Text("Calender")),
                    Center(child: Text("Stories")),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4038059, size.height * 0.1458333);
    path_0.lineTo(size.width * 0.08086253, size.height * 0.1458333);
    path_0.cubicTo(
        size.width * 0.05704420,
        size.height * 0.1458333,
        size.width * 0.03773585,
        size.height * 0.2204521,
        size.width * 0.03773585,
        size.height * 0.3125000);
    path_0.lineTo(size.width * 0.03773585, size.height * 0.6875000);
    path_0.cubicTo(
        size.width * 0.03773585,
        size.height * 0.7795479,
        size.width * 0.05704447,
        size.height * 0.8541667,
        size.width * 0.08086253,
        size.height * 0.8541667);
    path_0.lineTo(size.width * 0.9191375, size.height * 0.8541667);
    path_0.cubicTo(
        size.width * 0.9429569,
        size.height * 0.8541667,
        size.width * 0.9622642,
        size.height * 0.7795479,
        size.width * 0.9622642,
        size.height * 0.6875000);
    path_0.lineTo(size.width * 0.9622642, size.height * 0.3125000);
    path_0.cubicTo(
        size.width * 0.9622642,
        size.height * 0.2204521,
        size.width * 0.9429569,
        size.height * 0.1458333,
        size.width * 0.9191375,
        size.height * 0.1458333);
    path_0.lineTo(size.width * 0.5961941, size.height * 0.1458333);
    path_0.cubicTo(
        size.width * 0.5874178,
        size.height * 0.1485948,
        size.width * 0.5686523,
        size.height * 0.1739958,
        size.width * 0.5637925,
        size.height * 0.2535125);
    path_0.cubicTo(
        size.width * 0.5577170,
        size.height * 0.3529083,
        size.width * 0.5364528,
        size.height * 0.4605875,
        size.width * 0.5000000,
        size.height * 0.4605875);
    path_0.cubicTo(
        size.width * 0.4635472,
        size.height * 0.4605875,
        size.width * 0.4422830,
        size.height * 0.3529083,
        size.width * 0.4362075,
        size.height * 0.2535125);
    path_0.cubicTo(
        size.width * 0.4313477,
        size.height * 0.1739958,
        size.width * 0.4125822,
        size.height * 0.1485948,
        size.width * 0.4038059,
        size.height * 0.1458333);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffCC197D).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
