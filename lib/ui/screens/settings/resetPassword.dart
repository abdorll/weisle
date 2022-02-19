import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weisle/helpers/Alerts.dart';
import 'package:weisle/ui/screens/auth/sign_in.dart';
import 'package:weisle/ui/widgets/custom_fields.dart';
import 'package:weisle/ui/widgets/form_button.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/navigtion.dart';
import 'package:weisle/utils/base_provider.dart';
import 'package:weisle/utils/index.dart';
import '../../constants/colors.dart';

class ResetPasword extends StatefulWidget {
  const ResetPasword({Key? key}) : super(key: key);

  @override
  _ResetPaswordState createState() => _ResetPaswordState();
}

class _ResetPaswordState extends State<ResetPasword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child:
            Consumer<ResetPasswordProvider>(builder: (context, value, child) {
          return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
              children: [
                SizedBox(
                    height: 163,
                    width: 129,
                    child: Image.asset("assets/images/signIn.png")),
                PlainTextField(
                    onchanged: (String e) => value.setuserName = e,
                    leading: const Icon(Icons.person_add_alt_1,
                        color: Color(0xffFF2156)),
                    hint: "Username"),
                PasswordField(
                    onchanged: (String e) => value.setuserPass = e,
                    leading: const Icon(Icons.person_add_alt_1,
                        color: Color(0xffFF2156)),
                    hint: "Pawword"),
                PlainTextField(
                    onchanged: (e) => value.setsecAnswer = e,
                    leading: const Icon(Icons.phone, color: Color(0xffFF2156)),
                    hint: "Sec Answer"),
                const YMargin(20),
                FormButton(
                    enabled: true,
                    text: "Update profile",
                    function: () {
                      value.resetPass(context);
                    }),
                const YMargin(40),
              ]);
        }),
      ),
    );
  }
}

//------------------------------------------------------------RESET PASWORD PROVIDER
class ResetPasswordProvider extends BaseProvider {
  String? _userPass;
  String? _secAnswer;
  String? _userName;
  bool formValidity = false;

  String get userPass => _userPass ?? '';
  String get secAnswer => _secAnswer ?? '';
  String get userName => _userName ?? '';

  set setuserPass(String userPass) {
    _userPass = userPass;
    checkFormValidity();
    notifyListeners();
  }

  set setsecAnswer(String secAnswer) {
    _secAnswer = secAnswer;
    checkFormValidity();
    notifyListeners();
  }

  set setuserName(String userName) {
    _userName = userName;
    checkFormValidity();
    notifyListeners();
  }

  void checkFormValidity() {
    if ((_userPass != null) && (_secAnswer != null) && (_userName != null)) {
      formValidity = true;
    } else {
      formValidity = false;
    }
    notifyListeners();
  }

  void resetPass(BuildContext context) async {
    try {
      if (_userPass == null || _secAnswer == null || _userName == null) {
        Alerts.errorAlert(context, 'All fields are required', () {
          Navigator.pop(context);
        });
      } else {
        Alerts.loadingAlert(context, 'Resetting pass...');
        FocusScope.of(context).unfocus();
        setLoading = true;
        var registerResponse = await customerApiBasic.resetPass(
            userName: _userName, userPass: _userPass, secAnswer: _secAnswer);
        if (registerResponse['resposeCode'] == '00') {
          setLoading = false;
          print('Request Successful');
          navigate(context, const LoginScreen());
        } else if ((registerResponse['resposeCode'] == '01')) {
          Alerts.errorAlert(context, 'Invalid request', () {
            Navigator.pop(context);
          });
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

  ResetPasswordProvider() {
    checkFormValidity();
  }
}
