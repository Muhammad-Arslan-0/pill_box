import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pill_box/helper/app_colors.dart';
import 'package:pill_box/helper/app_images.dart';
import 'package:pill_box/helper/app_styles.dart';
import 'package:pill_box/helper/route_constant.dart';
import 'package:pill_box/widgets/bpm_chart.dart';
import 'package:pill_box/widgets/header_widget.dart';
import 'package:pill_box/widgets/health_stat_tile.dart';

class HeartRateScreen extends StatelessWidget {
  const HeartRateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.h),
        child: HeaderWidget(),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.h),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                SizedBox(
                  width: screenWidth * .7,
                  child: Text("Always Keep Yourself safe and",
                      style: AppStyles.extraBoldStyle!
                          .copyWith(color: Colors.grey, fontSize: 30.sp)),
                ),
                Image.asset(AppImages.star)
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Healthy",
                    style: AppStyles.extraBoldStyle!.copyWith(
                        color: AppColors.primaryColor, fontSize: 35.sp)),
                Image.asset(AppImages.learnMore)
              ],
            ),
            SizedBox(height: 40.h),
            RichText(
                text: TextSpan(
                    text: "Heart AVG bpm ",
                    style: TextStyle(color: Colors.black87, fontSize: 18.sp),
                    children: const [
                  TextSpan(
                      text: "76",
                      style: TextStyle(color: AppColors.primaryColor))
                ])),
            SizedBox(height: 10.h),
            Stack(
              children: [
                SizedBox(height: screenHeight * .25, child: BpmChart()),
                Positioned(
                    right: 10,
                    top: 10,
                    child: IconButton(
                        onPressed: () {
                          GoRouter.of(context)
                              .pushNamed(RouteConstant.heartGraphScreen);
                        },
                        icon: Icon(Icons.fullscreen, color: Colors.white)))
              ],
            ),
            SizedBox(height: 20.h),
            Text("Health Stats"),
            SizedBox(height: 10.h),
            HealthStatTile(
              img: AppImages.redHeart,
              title: "Heart Health",
              subtitle: "55",
              isHeart: true,
            ),
            SizedBox(height: 10.h),
            HealthStatTile(
              img: AppImages.leaf,
              title: "Healing",
              subtitle: "144%",
            ),
            SizedBox(height: 10.h),
            HealthStatTile(
              img: AppImages.emoji,
              title: "Oxygen",
              subtitle: "144%",
            ),
          ]),
        ),
      ),
    );
  }
}
