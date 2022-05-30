import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  Color activePageTheme = Colors.red;

  onAppInit() {
    //* get private ideas from online.

    //* save data to local storage.
  }
  updateAppTheme({themeColor}) => activePageTheme = themeColor;
}
