

import 'package:disenos/theme/customTheme.dart';
import 'package:disenos/theme/darkTheme.dart';
import 'package:disenos/theme/lightTheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeChange with ChangeNotifier {
  ThemeChange(int theme){
    switch(theme){
    case 1:
      _darkTheme=false;
      _customTheme=false;
      _currentTheme=lightThemeFile;
      break;
    case 2:
      _darkTheme=true;
      _customTheme=false;
      _currentTheme=darkThemeFile;
      break;
    case 3:
      _darkTheme=false;
      _customTheme=true;
      _currentTheme=customThemeFile;
      break;
    }
  }

    bool _darkTheme = false;
    bool _customTheme = false;

    ThemeData _currentTheme=ThemeData.light();

  bool get darkTheme=>_darkTheme;
  bool get customThem=>_customTheme;
  ThemeData get currenttheme=>_currentTheme;


  set darkTheme(bool val){
    _customTheme=false;
    _darkTheme=val;
    if (val) {
      _currentTheme=darkThemeFile;
    }else{
      _currentTheme=lightThemeFile;
    }
    notifyListeners();
  }
  set customTheme(bool val){
    _darkTheme=false;
    _customTheme=val;
    if (val) {
      _currentTheme=customThemeFile;
    }else{
      _currentTheme=customThemeFile;
    }
    notifyListeners();
  }




}


