import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_box/helper/app_images.dart';
import 'package:pill_box/helper/app_styles.dart';
import 'package:pill_box/widgets/bpm_chart.dart';
import 'package:pill_box/widgets/header_widget.dart';

class HeartGraphScreen extends StatelessWidget {
  const HeartGraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.h), child: HeaderWidget()),
      body: Column(
        children: [
          Center(
              child: Stack(
            children: [
              SizedBox(
                  width: screenWidth, child: Image.asset(AppImages.bgBlur)),
              Positioned(
                top: 80.h,
                child: Column(
                  children: [
                    SizedBox(
                        width: screenWidth,
                        height: screenHeight * .4,
                        child: Image.asset(AppImages.goldenHeart)),
                    Column(
                      children: [
                        Text(
                          "76",
                          style: AppStyles.extraBoldStyle!
                              .copyWith(fontSize: 25.sp),
                        ),
                        Text(
                          "bpm",
                          style: AppStyles.boldStyle,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
          Column(
            children: [
              SizedBox(
                  height: screenHeight * .25,
                  width: screenWidth * .9,
                  child: BpmChart())
            ],
          )
        ],
      ),
    );
  }
}
