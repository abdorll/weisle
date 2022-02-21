import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weisle/customer/sign_in.dart';
import 'package:weisle/customer/sign_up.dart';
import 'package:weisle/emergencySetup/setUp/setUp.dart';
import 'package:weisle/emergencySetup/setUp/setUpProvider.dart';
import 'package:weisle/service_locator.dart';
import 'package:weisle/customer/resetPassword.dart';
import 'package:weisle/customer/updateProfile.dart';
import 'package:weisle/subscription/getSubHistory.dart';
import 'package:weisle/ui/screens/welcome_screens/splash_screen.dart';
import 'package:weisle/ui/themes/light_theme/light_theme.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weisle/utils/index.dart';
import 'customer/accountLookup.dart';
import 'customer/notificationService/notoficationService.dart';
import 'customer/sqaPage.dart';
import 'emergencySetup/confirmSubscription.dart';
import 'emergencySetup/createSubscription.dart';
import 'emergencySetup/getPremiumPlan.dart';
import 'subscription/subscribtionHistoryByDate.dart';

void main() async {
  serviceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  var path = await getApplicationDocumentsDirectory();
  Hive.init(path.path);
  await Hive.openBox(weisleUserBox);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => SignInProvider()),
      ChangeNotifierProvider(create: (context) => SignUpProvider()),
      ChangeNotifierProvider(create: (context) => ResetPasswordProvider()),
      ChangeNotifierProvider(create: (context) => AccountLookupProvider()),
      ChangeNotifierProvider(create: (context) => SetUpProvider()),
      ChangeNotifierProvider(create: (context) => GetSubHistoryProvider()),
      ChangeNotifierProvider(create: (context) => SubHistoryByDateProvider()),
      ChangeNotifierProvider(create: (context) => PremiumPlansProvider()),
      ChangeNotifierProvider(create: (context) => SQaProvider()),
      ChangeNotifierProvider(
          create: (context) => ConfirmSubscriptionServiceProvider()),
      ChangeNotifierProvider(
          create: (context) => CreateSubscriptionServiceProvider()),
      ChangeNotifierProvider(
          create: (context) => NotificationServiceProvider()),
      ChangeNotifierProvider(create: (context) => CategoriesProvider()),
      ChangeNotifierProvider(create: (context) => SubHistoryByDateProvider()),
      ChangeNotifierProvider(create: (context) => UpdateProfileProvider()),
    ],
    child: const MyApp(),
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
