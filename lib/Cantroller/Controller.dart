import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;
  RxInt count = 0.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(isDarkMode.value ? ThemeData.dark() : ThemeData.light());
  }

  void GetValue() {
    count++;
  }

  void value() {
    count--;
  }
}
