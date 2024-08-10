import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Cantroller/Controller.dart';
import 'View/First_Page/splash_screen.dart';
import 'View/Home_Page/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(
            colorScheme: ColorScheme.dark(
          primary: Colors.lightBlue,
          secondary: Colors.lightBlue,
        )),
        theme: ThemeData(
          colorScheme: ColorScheme.light(
            primary: Colors.black,
            secondary: Color(0xff333333),
          ),
        ),
        themeMode:
            themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
        getPages: [
          GetPage(
              name: '/',
              page: () => FirstPage(),
              transition: Transition.fadeIn),
          GetPage(
              name: '/second',
              page: () => HomePage(),
              transition: Transition.fade),
        ],
      );
    });
  }
}
