import 'package:flutter/material.dart';

class MainProvider with ChangeNotifier {
  bool _floatingActionButtonIsOpened = false;
  ScrollController _homeScreenController = ScrollController();

  bool get floatingActionButtonIsOpened => _floatingActionButtonIsOpened;

  set floatingActionButtonIsOpened(bool value) {
    _floatingActionButtonIsOpened = value;
    notifyListeners();
  }

  ScrollController get homeScreenController => _homeScreenController;

  set homeScreenController(ScrollController value) {
    _homeScreenController = value;
    notifyListeners();
  }
}