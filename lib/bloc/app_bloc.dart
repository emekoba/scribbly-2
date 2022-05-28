import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  var count = 0.obs;
  Color activePageTheme = Colors.red;

  increment() => count++;
  updateAppTheme({themeColor}) => activePageTheme = themeColor;
}
