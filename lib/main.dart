import 'package:flutter/material.dart';
import 'package:weisle/service_locator.dart';
import 'package:weisle/ui/screens/welcome_screens/splash_screen.dart';
import 'package:weisle/ui/themes/light_theme/light_theme.dart';

void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      theme:  lightTheme,
      home: const SplashScreen(),
    );
  }
}
 