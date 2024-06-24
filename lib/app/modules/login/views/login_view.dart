import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:userdetails/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "USER DIRECTORY",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            child: Material(
              elevation: 10,
              shape: CircleBorder(),
              child: IconButton(
                onPressed: () {
                  Get.toNamed(Routes.HOME);
                },
                icon: Icon(
                  Icons.arrow_forward,
                  size: 50,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Lottie.asset(
            'assets/lottie/directory.json',
            width: 400,
            height: 400,
            fit: BoxFit.fill,
            repeat: true,
            reverse: false,
            animate: true,
          )
        ],
      ),
    );
  }
}
