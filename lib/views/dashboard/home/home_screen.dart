import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_box/helper/app_images.dart';
import 'package:pill_box/helper/app_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.h),
        child: Column(
          children: [
            Center(child: Image.asset(AppImages.homeImg)),
            SizedBox(height: 20.h),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("Our Brands", style: AppStyles.boldStyle),
              Text("View All", style: AppStyles.basicStyle)
            ]),
            SizedBox(height: 20.h),
            SizedBox(
              height: screenHeight * .3,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      AppImages.homeImg,
                      fit: BoxFit.contain,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
