import 'dart:async';

import 'package:app_e_commerce_project/Ui/Auth/login/login_screen.dart';
import 'package:app_e_commerce_project/Ui/Utils/my_colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash_screen';
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    });
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      
      body: Image.asset('assets/splash_screen.png',
      fit: BoxFit.contain,
      width: double.infinity,
      height: double.infinity
      ));
  }
}
