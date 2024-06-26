import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inicio_sesion/view/splash.view.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}

