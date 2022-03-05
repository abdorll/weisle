import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:weisle/customer/sign_in.dart';
import 'package:weisle/helpers/Alerts.dart';
import 'package:weisle/ui/constants/asset_images.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:weisle/ui/widgets/custom_fields.dart';
import 'package:weisle/ui/widgets/form_button.dart';
import 'package:weisle/ui/widgets/header.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/navigtion.dart';
import 'package:weisle/utils/base_provider.dart';
import 'package:weisle/utils/index.dart';
import 'package:weisle/utils/user_details_getter.dart';

class SQaPage extends StatefulWidget {
  const SQaPage({Key? key}) : super(key: key);

  @override
  _SQaPageState createState() => _SQaPageState();
}

class _SQaPageState extends State<SQaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            const Header(),
            const YMargin(20),
            TextOf('Set security Q&A', 22, FontWeight.w600, black),
            TextOf(
                'Set a security security question and answer for account security purpose',
                17,
                FontWeight.w400,
                black),
            const YMargin(20),
            Expanded(
              child: Consumer<SQaProvider>(builder: (context, value, child) {
                return ListView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 36),
                    children: [
                      // PlainTextField(
                      //     onchanged: (String e) => value.setusername = e,
                      //     leading: const Icon(Icons.person_add_alt_1,
                      //         color: Color(0xffFF2156)),
                      //     hint: "Username"),
                      PlainTextField(
                          onchanged: (String e) => value.setsecQuestion = e,
                          leading: const Icon(Icons.person_add_alt_1,
                              color: Color(0xffFF2156)),
                          hint: "SQA Question"),
                      PlainTextField(
                          onchanged: (e) => value.setsecAnswer = e,
                          leading:
                              const Icon(Icons.phone, color: Color(0xffFF2156)),
                          hint: "SQA answer"),
                      const YMargin(20),
                      FormButton(
                          enabled: true,
                          text: "Set SQA",
                          function: () {
                            value.sQa(context);
                          }),
                      const YMargin(40),
                    ]);
              }),
            ),
          ],
        ),
      ),
    );
  }
}

//------------------------------------------UPDATE PROFILE PROVIDER STARTS HERE
class SQaProvider extends BaseProvider {
  String? _username;
  String? _secQuestion;
  String? _secAnswer;
  bool formValidity = false;
  static var securityAnswer;

  String get username => _username ?? "";
  String get secQuestion => _secQuestion ?? '';
  String get secAnswer => _secAnswer ?? '';

  set setusername(String username) {
    _username = username;
    checkFormValidity();
    notifyListeners();
  }

  set setsecQuestion(String secQuestion) {
    _secQuestion = secQuestion;
    checkFormValidity();
    notifyListeners();
  }

  set setsecAnswer(String secAnswer) {
    _secAnswer = secAnswer;
    checkFormValidity();
    notifyListeners();
  }

  void checkFormValidity() {
    if ((_username != null) && (_secQuestion != null) && (_secAnswer != null)) {
      formValidity = true;
    } else {
      formValidity = false;
    }
    notifyListeners();
  }

  void sQa(BuildContext context) async {
    var box = await Hive.openBox(weisleUserBox);

    setusername = box.get(weisleUserName) ?? box.get(rweisleUserName);
    try {
      if (_username == null || _secQuestion == null) {
        Alerts.errorAlert(context, 'All fields are required', () {
          Navigator.pop(context);
        });
      } else if (_secQuestion!.length < 1) {
        Alerts.errorAlert(context, 'secQuestion lengt too short', () {
          Navigator.pop(context);
        });
      } else {
        Alerts.loadingAlert(context, 'Setting SQA...');
        FocusScope.of(context).unfocus();
        setLoading = true;
        var SQaResponse = await customerApiBasic.setSqa(
            userName: username,
            secQuestion: _secQuestion,
            secAnswer: _secAnswer);
        print("Weisle setSQA response is $SQaResponse");
        if (SQaResponse['resposeCode'] == '00') {
          setLoading = false;
          var box = await Hive.openBox(weisleUserBox);
          SQaProvider.securityAnswer = box.put(weisleSecurityAnswer, secAnswer);
          print('Request Successful');
          goBack(context);
          Alerts.successAlert(context, 'Security question set successfully',
              () {
            goBack(context);
          });
        } else if (SQaResponse['resposeCode'] == '01') {
          goBack(context);
          Alerts.errorAlert(context, 'Invalid credentials', () {
            Navigator.pop(context);
          });
        } else {
          print("Weisle setSQA Response is $SQaResponse");
        }
      }
    } catch (e) {
      print("Weisle error: $e");
      Navigator.pop(context);
      // Alerts.errorAlert(context, 'Something went Wrong', () {
      //   Navigator.pop(context);
      // }
    }
  }

  SQaProvider() {
    checkFormValidity();
  }
}
