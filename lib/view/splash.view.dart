import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inicio_sesion/utils/global.colors.dart';
import 'package:inicio_sesion/view/login.view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Get.to(LoginView());
      });
    return Scaffold(
      backgroundColor: GlobalColor.mainColor,
      body: const Center(
        child: Image(image: AssetImage('images/logoProinsa-removebg.png')),
      ),

    );
  }
}