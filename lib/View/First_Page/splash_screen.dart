import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black38,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('First Page',style: TextStyle(fontSize: 30,color: Colors.white),),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed('/second');
          },
          child: Text('Click Here',style: TextStyle(fontSize: 20),),
        ),
      ),
    );
  }
}
