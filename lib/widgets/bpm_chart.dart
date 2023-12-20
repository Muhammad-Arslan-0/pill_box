import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mrx_charts/mrx_charts.dart';

import '../helper/app_colors.dart';
import '../helper/app_styles.dart';

class BpmChart extends StatelessWidget {
  const BpmChart({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
      height: screenHeight * .3,
      width: screenWidth,
      decoration: BoxDecoration(
          color: Colors.black87, borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: EdgeInsets.all(8.h),
        child: Stack(
          children: [
            Container(
              height: screenHeight * .3,
              color: Colors.transparent,
              width: screenWidth,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: screenHeight * .22,
                child: Chart(
                  layers: layers(),
                  padding: EdgeInsets.symmetric(horizontal: 30.w).copyWith(
                    bottom: 12.0,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 5,
              left: 10,
              child: Text(
                "Heart's bpm",
                style: AppStyles.boldStyle!.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<ChartLayer> layers() {
    final from = DateTime(2023, 10, 15);
    final to = DateTime(2023, 10, 21);
    final frequency =
        (to.millisecondsSinceEpoch - from.millisecondsSinceEpoch) / 6.0;
    final values = [10, 69, 89, 5, 46, 76, 89];
    return [
      ChartHighlightLayer(
        shape: () => ChartHighlightLineShape<ChartLineDataItem>(
          backgroundColor: const Color(0xFF331B6D),
          currentPos: (item) => item.currentValuePos,
          radius: BorderRadius.all(Radius.circular(8.r)),
          width: 60.0,
        ),
      ),
      ChartAxisLayer(
        settings: ChartAxisSettings(
          x: ChartAxisSettingsAxis(
            frequency: frequency,
            max: to.millisecondsSinceEpoch.toDouble(),
            min: from.millisecondsSinceEpoch.toDouble(),
            textStyle: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 15.sp,
            ),
          ),
          y: ChartAxisSettingsAxis(
            frequency: 20.0,
            max: 200.0,
            min: 0.0,
            textStyle: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 0,
            ),
          ),
        ),
        labelX: (value) => DateFormat('EE')
            .format(DateTime.fromMillisecondsSinceEpoch(value.toInt()))
            .substring(0, 2),
        labelY: (value) => value.toInt().toString(),
      ),
      ChartLineLayer(
        items: List.generate(
          7,
          (index) => ChartLineDataItem(
            x: (index * frequency) + from.millisecondsSinceEpoch,
            // value: Random().nextInt(180) + 20,
            value: values[index].toDouble(),
          ),
        ),
        settings: const ChartLineSettings(
          color: AppColors.primaryColor,
          thickness: 4.0,
        ),
      ),
      ChartTooltipLayer(
        shape: () => ChartTooltipLineShape<ChartLineDataItem>(
          backgroundColor: Colors.black,
          circleBackgroundColor: Colors.white,
          circleBorderColor: Colors.white,
          circleSize: 4.0,
          circleBorderThickness: 2.0,
          currentPos: (item) => item.currentValuePos,
          onTextValue: (item) => item.value.toInt().toString(),
          marginBottom: 6.0,
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8.0,
          ),
          radius: 6.0,
          textStyle: const TextStyle(
            color: Colors.white,
            letterSpacing: 0.2,
            fontSize: 15.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ];
  }
}
