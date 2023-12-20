import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helper/app_images.dart';
import '../helper/app_styles.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            SvgPicture.asset(AppImages.logoCircle),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome!", style: AppStyles.boldStyle),
                SizedBox(height: 5),
                Text("Demo User", style: AppStyles.boldStyle),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
