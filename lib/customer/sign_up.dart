import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weisle/customer/sign_in.dart';
import 'package:weisle/helpers/alerts.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/screens/dashboard/landing_screen.dart';
import 'package:weisle/ui/widgets/custom_fields.dart';
import 'package:weisle/ui/widgets/form_button.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/navigtion.dart';
import 'package:weisle/utils/base_provider.dart';
import 'package:weisle/utils/index.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Consumer<SignUpProvider>(builder: (context, value, child) {
          return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
              children: [
                SizedBox(
                    height: 163,
                    width: 129,
                    child: Image.asset("assets/images/signIn.png")),
                PlainTextField(
                    onchanged: (String e) => value.setfullName = e,
                    leading: const Icon(Icons.person_add_alt_1,
                        color: Color(0xffFF2156)),
                    hint: "Fullname"),
                PlainTextField(
                    onchanged: (e) => value.setPhoneNumber = e,
                    leading: const Icon(Icons.phone, color: Color(0xffFF2156)),
                    hint: "Phone Number"),
                PlainTextField(
                    onchanged: (e) => value.setUserName = e,
                    leading: const Icon(Icons.person, color: Color(0xffFF2156)),
                    hint: "Username"),
                PlainTextField(
                    onchanged: (e) => value.setRegCode = e,
                    leading: const Icon(Icons.code, color: Color(0xffFF2156)),
                    hint: "Registeration Code"),
                PasswordField(
                    onchanged: (e) => value.setUserPass = e,
                    leading: const Icon(Icons.code, color: Color(0xffFF2156)),
                    hint: "Passworrd"),
                // PasswordField(
                //     onchanged: (e) => value.setUserPass = e,
                //     leading: const Icon(Icons.lock, color: Color(0xffFF2156)),
                //     hint: "Password"),
                // PasswordField(
                //     leading: const Icon(Icons.lock, color: Color(0xffFF2156)),
                //     hint: "Confirm Password"),
                const YMargin(20),
                FormButton(
                    enabled: true,
                    text: "Register",
                    function: () {
                      value.register(context);
                    }),
                // FormButton(
                //     text: "Register",
                //     function: () {
                //       value.register(context);
                //     }),
                const YMargin(40),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text("Already having an account?")),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: Text(
                        "LOGIN",
                        style: TextStyle(color: colorPrimary),
                      ))
                ])
              ]);
        }),
      ),
    );
  }
}

//-----------------------------------------SIGN UP PROVIDER
class SignUpProvider extends BaseProvider {
  String? _fullName;
  String? _phoneNo;
  String? _userName;
  String? _userPass;
  String? _regCode;
  bool formValidity = false;

  String get fullName => _fullName ?? '';
  String get phoneNo => _phoneNo ?? '';
  String get userName => _userName ?? '';
  String get userPass => _userPass ?? '';
  String get regCode => _regCode ?? '';

  set setfullName(String fullName) {
    _fullName = fullName;
    checkFormValidity();
    notifyListeners();
  }

  set setPhoneNumber(String phoneNo) {
    _phoneNo = phoneNo;
    checkFormValidity();
    notifyListeners();
  }

  set setUserName(String userName) {
    _userName = userName;
    checkFormValidity();
    notifyListeners();
  }

  set setUserPass(String userPass) {
    _userPass = userPass;
    checkFormValidity();
    notifyListeners();
  }

  set setRegCode(String regCode) {
    _regCode = regCode;
    checkFormValidity();
    notifyListeners();
  }

  void checkFormValidity() {
    if ((_fullName != null) &&
        (_phoneNo != null) &&
        (_userName != null) &&
        (_userPass != null) &&
        (_userPass != null)) {
      formValidity = true;
    } else {
      formValidity = false;
    }
    notifyListeners();
  }

  void register(BuildContext context) async {
    try {
      if (_fullName == null ||
          _phoneNo == null ||
          _userName == null ||
          _userPass == null ||
          _regCode == null) {
        Alerts.errorAlert(context, 'All fields are required', () {
          Navigator.pop(context);
        });
      } else if (_phoneNo!.length < 11) {
        Alerts.errorAlert(context, 'Make phone number length be 11', () {
          Navigator.pop(context);
        });
      } else {
        Alerts.loadingAlert(context, 'Registering...');
        FocusScope.of(context).unfocus();
        setLoading = true;
        var registerResponse = await customerApiBasic.register(
            fullName: _fullName,
            phoneNo: _phoneNo,
            userName: _userName,
            userPass: _userPass,
            regCode: _regCode);

        // print(registerResponse['resposeCode']);
        // // ignore: avoid_print
        // print("Weisle register Response is $registerResponse");
        if (registerResponse['resposeCode'] == '00') {
          setLoading = false;
          print('Request Successful');
          navigate(context, LandingScreen());
        } else if ((registerResponse['resposeCode'] == '01')) {
          setLoading = false;
          notifyListeners();
          Alerts.errorAlert(context, registerResponse['message'], () {
            Navigator.pop(context);
          });

          // print("Weisle register Response is $registerResponse");
        } else {
          setLoading = false;
          notifyListeners();
          Alerts.errorAlert(context, registerResponse['message'], () {
            Navigator.pop(context);
          });
        }
      }
    } catch (e) {
      setLoading = false;
      // ignore: avoid_print
      // print("Weisle error: $e");
      Alerts.errorAlert(context, 'Something went wrong', () {
        Navigator.pop(context);
      });
    }
  }

  SignUpProvider() {
    checkFormValidity();
  }
}
