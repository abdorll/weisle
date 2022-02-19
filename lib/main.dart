import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weisle/service_locator.dart';
import 'package:weisle/ui/screens/auth/sign_up.dart';
import 'package:weisle/ui/screens/settings/notoficationService.dart';
import 'package:weisle/ui/screens/settings/resetPassword.dart';
import 'package:weisle/ui/screens/settings/setSqa.dart';
import 'package:weisle/ui/screens/settings/updateProfile.dart';
import 'package:weisle/ui/screens/welcome_screens/splash_screen.dart';
import 'package:weisle/ui/themes/light_theme/light_theme.dart';
import 'package:weisle/ui/screens/auth/sign_in.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weisle/utils/index.dart';
import 'ui/screens/settings/accountLookup.dart';

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
      ChangeNotifierProvider(create: (context) => SetSQaProvider()),
      ChangeNotifierProvider(
          create: (context) => NotificationServiceProvider()),
      ChangeNotifierProvider(create: (context) => CategoriesProvider()),
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
