import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_assignment/features/home/presentation/pages/home_screen.dart';
import 'package:navigation_assignment/features/authentication/presentation/pages/login_screen.dart';
import 'package:navigation_assignment/features/on_boarding/presentation/pages/image_screen_1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String loginStatus = 'login';
  void initState() {
    super.initState();

    whereToRedirect();
  }

  Widget build(BuildContext context) {

    return Container(
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: Center(
        child: SvgPicture.asset(
          'assets/icons/coditas_logo.svg',
          height: 96,
          width: 32,
        ),
      ),
    );
  }

  void whereToRedirect() async {
    final sharedPref = await SharedPreferences.getInstance();
    final bool? isLoggedIn = await sharedPref.getBool('isLoggedIn') ?? false;
    // sharedPref.setBool('loginStatus', false);

    Timer(Duration(seconds: 1), () {
      // if (isLoggined != null) {
      //   if (isLoggined) {
      //     context.go('/home');
      //   } else {
      //     context.go('/login');
      //   }
      //   ;
      // } else {
      //   context.go('/onboarding');
      // }
      // ;
      if(isLoggedIn!){
        context.go('/home');
      } else if(!isLoggedIn){
         context.go('/login');
      }
      else {
       context.go('/onboarding');
      }
    }
    );
  }
}
