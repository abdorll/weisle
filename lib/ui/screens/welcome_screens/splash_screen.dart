// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weisle/customer/sign_in.dart';
import 'package:weisle/logic/local_db/first_time.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
        Duration(seconds: 5),
        () async => {
              firstTime().then((value) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => value ?? true
                            ? OnboardingScreen()
                            : LoginScreen()));
              })
            });

    super.initState();
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
