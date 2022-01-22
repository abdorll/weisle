import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> init() async {
  SharedPreferences sharedPreferences;
  sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences;
}

Future<bool?> firstTime() async {
  try {
    // ignore: avoid_print
    print((await init()).getBool("first_time"));
  } catch (e) {
    // ignore: invalid_use_of_visible_for_testing_member
    SharedPreferences.setMockInitialValues({});
  }
  return (await init()).getBool("first_time");
}

Future<void> setFirstTime() async {
  (await init()).setBool("first_time", false);
  // ignore: avoid_print
  print((await init()).getBool("first_time"));
}
