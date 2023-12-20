import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/app_styles.dart';

class PillsTile extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String trailing;
  const PillsTile({super.key, required this.image, required this.title, required this.subtitle, required this.trailing});

  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.sizeOf(context).width;
    return Container(
      width: screenWidth,
      decoration: BoxDecoration(
          border: Border.all(width: .5, color: Colors.grey),
          borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.fromLTRB(5, 10, 2, 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
              height: 80,
              width: 80,
              child: Image.asset(image)),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenWidth * .5,
                  child: Text(
                    title,
                    style: AppStyles.extraBoldStyle!
                        .copyWith(fontSize: 20.sp),
                  ),
                ),
                Text(
                  subtitle,
                  style:
                  AppStyles.basicStyle!.copyWith(fontSize: 16.sp),
                ),
              ]),
          Text(
            trailing,
            style: AppStyles.basicStyle!.copyWith(fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
