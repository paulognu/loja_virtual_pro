import 'package:flutter/material.dart';

class PageManager {
  PageManager(this.pageController);

  final PageController pageController;

  int _page = 0;
  int get page => _page;

  void setPage(int value) {
    if (_page == value) {
      return;
    }

    _page = value;
    pageController.jumpToPage(value);
  }
}
