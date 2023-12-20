import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_box/helper/app_colors.dart';
import 'package:pill_box/helper/app_images.dart';
import 'package:pill_box/widgets/app_button.dart';
import 'package:pill_box/widgets/header_widget.dart';
import 'package:chart_sparkline/chart_sparkline.dart';

class BeatMeasureScreen extends StatelessWidget {
  BeatMeasureScreen({super.key});
  final List<double> graphData = [
    0.0,
    0.0,
    0.0,
    5.0,
    -2.5,
    2.0,
    0.0,
    0.0,
    0.0,
    5.0,
    -2.5,
    1.5,
    0,
    0,
    0,
    5.0,
    -2.5,
    1.5,
    0,
    0,
    0,
    5.0,
    -2.5,
    1.5,
    0,
    0
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.h), child: HeaderWidget()),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(child: Image.asset(AppImages.recordingBeats)),
          Sparkline(
              lineWidth: 3,
              lineGradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    AppColors.primaryColor,
                    AppColors.primaryColor.withOpacity(.3)
                  ]),
              data: graphData),
          AppButton(
              height: 40.h,
              width: screenWidth * .5,
              text: "Stop",
              onPressed: () {})
        ],
      ),
    );
  }
}
