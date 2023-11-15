


import 'package:disenos/pages/slideshow_page.dart';
import 'package:flutter/material.dart';

class LayoutModel with ChangeNotifier {
  Widget _currentPage=SladeShowPage();

  set currentPage(Widget widget){
    _currentPage=widget;
    notifyListeners();
  }

  Widget get currentPage => _currentPage;
}