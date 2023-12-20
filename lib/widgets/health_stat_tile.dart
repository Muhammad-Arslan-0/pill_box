import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pill_box/helper/app_colors.dart';
import 'package:pill_box/helper/app_styles.dart';
import 'package:pill_box/helper/route_constant.dart';

class HealthStatTile extends StatelessWidget {
  final String img;
  final String title;
  final String subtitle;
  final bool isHeart;
  const HealthStatTile(
      {super.key,
      required this.img,
      required this.title,
      required this.subtitle,
      this.isHeart = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.tileBlackColor,
          borderRadius: BorderRadius.circular(20.r)),
      child: ListTile(
        leading: Container(
          height: 50.h,
          width: 50.h,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: .5),
              borderRadius: BorderRadius.circular(10.r)),
          child: Image.asset(img),
        ),
        title: Text(title,
            style: AppStyles.boldStyle!.copyWith(color: Colors.white)),
        subtitle: Text(
          subtitle,
          style: AppStyles.extraBoldStyle!
              .copyWith(color: Colors.white, fontSize: 20.sp),
        ),
        trailing: isHeart
            ? ElevatedButton(
                onPressed: () {
                  GoRouter.of(context)
                      .pushNamed(RouteConstant.beatMeasureScreen);
                },
                child: Text("Measure"))
            : Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white),
      ),
    );
  }
}
