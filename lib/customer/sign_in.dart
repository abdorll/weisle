import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:weisle/helpers/Alerts.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/screens/dashboard/landing_screen.dart';
import 'package:weisle/ui/widgets/custom_fields.dart';
import 'package:weisle/ui/widgets/form_button.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/navigtion.dart';
import 'package:weisle/utils/base_provider.dart';
import 'package:weisle/utils/index.dart';

import 'sign_up.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Consumer<SignInProvider>(
          builder: (BuildContext context, value, child) {
            return ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
                children: [
                  // Text("Welcome", textAlign: TextAlign.center, style: onboardTitle.copyWith(fontSize: 30)),
                  SizedBox(
                      height: 322,
                      width: 400,
                      child: Image.asset("assets/images/welcome.png")),
                  PlainTextField(
                      onchanged: (e) => value.setusername = e,
                      leading:
                          const Icon(Icons.person, color: Color(0xffFF2156)),
                      hint: "Username"),
                  PasswordField(
                      onchanged: (e) => value.setPasword = e,
                      leading: const Icon(Icons.lock, color: Color(0xffFF2156)),
                      hint: "Password"),
                  const YMargin(40),
                  FormButton(
                      enabled: true,
                      text: "Login",
                      function: () {
                        value.login(context);
                      }),
                  const YMargin(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                          },
                          child: const Text("Dont have an account?")),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(color: colorPrimary),
                          ))
                    ],
                  )
                ]);
          },
        ),
      ),
    );
  }
}

//------------------------------------------------LOGIN PROVIDER STARTS HERE
class SignInProvider extends BaseProvider {
  String? _username;
  String? _password;
  bool formValidity = false;

  String get username => _username ?? " ";
  String get password => _password ?? " ";

  set setusername(String username) {
    _username = username;
    checkFormValidity();
    notifyListeners();
  }

  set setPasword(String password) {
    _password = password;
    checkFormValidity();
    notifyListeners();
  }

  void checkFormValidity() {
    if ((_username != null) && (_password != null)) {
      formValidity = true;
    } else {
      formValidity = false;
    }
    notifyListeners();
  }

  void login(BuildContext context) async {
    try {
      if (_username == null || _password == null) {
        Alerts.errorAlert(context, 'Al fields are required', () {
          Navigator.pop(context);
        });
      } else if (_password!.length < 1) {
        Alerts.errorAlert(context, 'Password lengt too short', () {
          Navigator.pop(context);
        });
      } else {
        Alerts.loadingAlert(context, 'Login in progress');
        FocusScope.of(context).unfocus();
        setLoading = true;
        var loginResponse = await customerApiBasic.signIn(
            username: _username, password: _password);

        print("Weisle Login Response is $loginResponse");
        if (loginResponse['resposeCode'] == '00') {
          setLoading = false;
          print('Request Successful');
          //₦100,000
          var userDetails = await Hive.openBox(weisleUserBox);
          userDetails.put(isLoggedInUser, true);
          userDetails.put(weisleId, loginResponse['data']["weizleId"]);
          userDetails.put(weisleFullName, loginResponse['data']["fullName"]);
          userDetails.put(weislephoneNumber, loginResponse['data']["phoneNo"]);
          userDetails.put(weisleUserName, loginResponse['data']["userName"]);
          userDetails.put(
              weisleaccountType, loginResponse['data']['accountType']);
          userDetails.put(weislemyRefCode, loginResponse['data']["myRefCode"]);
          userDetails.put(weisleuserStatus, loginResponse);
          goBack(context);
          Alerts.successAlert(context, 'Login successful', () {
            navigateReplaces(context, LandingScreen());
          });
        } else {
          goBack(context);
          Alerts.errorAlert(context, 'Failed', () {
            Navigator.pop(context);
          });
          print("Weisle Login Response is $loginResponse");
        }
      }
    } catch (e) {
      print("Weisle error: $e");
      goBack(context);
      Alerts.errorAlert(context, 'Something went Wrong', () {
        Navigator.pop(context);
      });
    }
  }

  SignInProvider() {
    checkFormValidity();
  }
}
