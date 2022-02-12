import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weisle/service_locator.dart';
import 'package:weisle/ui/screens/auth/sign_up.dart';
import 'package:weisle/ui/screens/welcome_screens/splash_screen.dart';
import 'package:weisle/ui/themes/light_theme/light_theme.dart';
import 'package:weisle/ui/screens/auth/sign_in.dart';

void main() {
  serviceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => SignInProvider()),
      ChangeNotifierProvider(create: (context) => SignUpProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: const SplashScreen(),
    );
  }
}
