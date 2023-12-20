import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pill_box/helper/app_colors.dart';
import 'package:pill_box/helper/app_images.dart';
import 'package:pill_box/provider/dashboard_provider.dart';
import 'package:pill_box/widgets/header_widget.dart';

final _provider = ChangeNotifierProvider((ref) => DashboardProvider());

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final read = ref.read(_provider.notifier);
      final watch = ref.watch(_provider);
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          currentIndex: watch.currentIndex,
          onTap: (index) {
            read.changeCurrentIndex(index);
          },
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImages.home,
                    colorFilter: watch.currentIndex == 0
                        ? ColorFilter.mode(
                            AppColors.primaryColor, BlendMode.srcIn)
                        : null),
                label: "Home"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.health,
                  colorFilter: watch.currentIndex == 1
                      ? ColorFilter.mode(
                          AppColors.primaryColor, BlendMode.srcIn)
                      : null,
                ),
                label: "Health"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImages.container), label: ""),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImages.history,
                    colorFilter: watch.currentIndex == 3
                        ? ColorFilter.mode(
                            AppColors.primaryColor, BlendMode.srcIn)
                        : null),
                label: "History"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_outlined), label: "Profile"),
          ],
        ),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(120.h), child: HeaderWidget()),
        body: read.screens[watch.currentIndex],
      );
    });
  }
}
