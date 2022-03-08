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

  //------------------------------------------------USER DETAILS SETTER AND GETTER
  String? _fullName;
  String? _accountType;
  String? _userName;
  String? _userStatus;
  String? _referralCode;
  String? _weisleId;
  String? _phoneNo;
  //-----------------------------FROM SUB HISTORY BY DATE
  String? _id;
  String? _txtRef;
  String? _planAmt;
  String? _planCurrency;
  String? _emergencyCountry;
  String? _subStatus;
  String? _createdDate;
  bool _userloggedIn = false;
  String get fullName => _fullName ?? 'full name';
  String get uername => _username ?? 'username';
  String get phoneNo => _phoneNo ?? 'Phone No';
  String get accountType => _accountType ?? 'accountType';
  String get weisleId => _weisleId ?? 'weisleId';
  String get userStatus => _userStatus ?? 'userStatus';

  String get referralCode => _referralCode ?? 'referralCode';
  //---------------------------------FROM SUB HISTORY BY DATE
  String get id => _id ?? 'id';
  String get txtRef => _txtRef ?? 'txtRef';
  String get planAmt => _planAmt ?? 'planAmt';
  String get planCurrency => _planCurrency ?? 'planCurrency';
  String get emergencyCountry => _emergencyCountry ?? 'emergencyCountry';
  String get subStatus => _subStatus ?? 'subStatus';
  String get createdDate => _createdDate ?? 'createdDate';
  bool get userloggedIn => _userloggedIn;
  static var userName;
  set setfullName(String fullName) {
    _fullName = fullName;
    notifyListeners();
  }

  set setaccountType(String accountType) {
    _accountType = accountType;
    notifyListeners();
  }

  set setreferralCode(String referralCode) {
    _referralCode = referralCode;
    notifyListeners();
  }

  set setUsername(String username) {
    _userName = username;
    notifyListeners();
  }

  set setuserStatus(String userStatus) {
    _userStatus = userStatus;
    notifyListeners();
  }

  set setuserloggedIn(bool userloggedIn) {
    _userloggedIn = userloggedIn;
    notifyListeners();
  }

  //---------------------------------FROM SUB HISTORY BY DATE
  set setid(String id) {
    _id = id;
    notifyListeners();
  }

  set settxtRef(String txtRef) {
    _txtRef = txtRef;
    notifyListeners();
  }

  set setplanAmt(String planAmt) {
    _planAmt = planAmt;
    notifyListeners();
  }

  set setplanCurrency(String planCurrency) {
    _planCurrency = planCurrency;
    notifyListeners();
  }

  set setemergencyCountry(String emergencyCountry) {
    _emergencyCountry = emergencyCountry;
    notifyListeners();
  }

  set setsubStatus(String subStatus) {
    _subStatus = subStatus;
    notifyListeners();
  }

  set setcreatedDate(String createdDate) {
    _createdDate = createdDate;
    notifyListeners();
  }

  set setweisleId(String weisleId) {
    _weisleId = weisleId;
    notifyListeners();
  }

  set setphoneNo(String phoneNo) {
    _phoneNo = phoneNo;
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
          userDetails.put(weislephoneNumber, loginResponse['data']["phoneNo"]);
          userDetails.put(
              weisleuserStatus, loginResponse['data']["userStatus"]);
          setUsername = userDetails.get(weisleUserName);
          setweisleId = userDetails.get(weisleId) ?? userDetails.get(weisleid);
          setfullName = userDetails.get(weisleFullName);
          setphoneNo = userDetails.get(weislephoneNumber);
          setaccountType = userDetails.get(weisleaccountType);
          setreferralCode = userDetails.get(weislemyRefCode);
          setuserStatus = userDetails.get(weisleuserStatus);
          //---------------------------------FROM SUB HISTORY BY DATE
          // setid = userDetails.get(weisleId);
          // settxtRef = userDetails.get(weisletxtRef);
          // setplanAmt = userDetails.get(weisleplanAmt);
          // setplanCurrency = userDetails.get(weisleplanCurrency);
          // setemergencyCountry = userDetails.get(weisleemergencyCountry);
          // setsubStatus = userDetails.get(weislesubStatus);
          // setcreatedDate = userDetails.get(weislecreatedDate);
          goBack(context);
          Alerts.successAlert(context, 'Login successful', () {
            navigatedForever(context, LandingScreen());
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
