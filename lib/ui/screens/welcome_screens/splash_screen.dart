// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:weisle/customer/welcome_back.dart';
import 'package:weisle/utils/index.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void nextPageCaller() async {
    var box = await Hive.openBox(weisleUserBox);
    bool userWasLoggedIn = box.get(isLoggedInUser) ?? false;
    await Future.delayed(Duration(seconds: 2), () {
      userWasLoggedIn == true
          ? Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => WelcomeBack()))
          : Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => OnboardingScreen()));
    });
  }

  @override
  void initState() {
    super.initState();
    nextPageCaller();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: 314,
                height: 314,
                child: Image.asset('assets/images/weisle_logo.png'),
              ),
            ),
          ]),
    );
  }
}
