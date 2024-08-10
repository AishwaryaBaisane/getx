import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Cantroller/Controller.dart';

class HomePage extends StatelessWidget {
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.onSecondary,
        // backgroundColor: Color(0xff333333),
        // backgroundColor: Colors.black45,

        // centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            // color: Colors.white,
            // color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        title: Text(
          'GetXTheme Change',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            // color: Colors.white
            // color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: themeController.toggleTheme,
            child: Text('Change Theme'),
          ),
        ],
      ),
      body: Center(
        child: Obx(
          () => Text(
            '${themeController.count.value}',
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                themeController.GetValue();
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                themeController.value();
              },
              child: Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
