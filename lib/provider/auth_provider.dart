import 'package:flutter/material.dart';
class AuthProvider extends ChangeNotifier {
  bool _isRemembered = false;
  bool get isRemembered => _isRemembered;


  changeCheckBox(bool value) {
    _isRemembered = value;
    notifyListeners();
  }
}
