import 'package:flutter/material.dart';
import 'package:pill_box/views/dashboard/health/health_screen.dart';
import 'package:pill_box/views/dashboard/history/history_screen.dart';
import 'package:pill_box/views/dashboard/home/home_screen.dart';

class DashboardProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  List screens = [
    HomeScreen(),
    HealthScreen(),
    HomeScreen(),
    HistoryScreen(),
    HomeScreen()
  ];

  changeCurrentIndex(int index) {
    if (index == 2) {
      _currentIndex = 0;
      notifyListeners();
    } else {
      _currentIndex = index;
      notifyListeners();
    }
  }
}
