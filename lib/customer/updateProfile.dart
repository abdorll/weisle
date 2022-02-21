import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weisle/customer/sign_in.dart';
import 'package:weisle/helpers/Alerts.dart';
import 'package:weisle/ui/widgets/custom_fields.dart';
import 'package:weisle/ui/widgets/form_button.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/navigtion.dart';
import 'package:weisle/utils/base_provider.dart';
import 'package:weisle/utils/index.dart';

import '../ui/constants/colors.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({Key? key}) : super(key: key);

  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child:
            Consumer<UpdateProfileProvider>(builder: (context, value, child) {
          return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
              children: [
                SizedBox(
                    height: 163,
                    width: 129,
                    child: Image.asset("assets/images/signIn.png")),
                PlainTextField(
                    onchanged: (String e) => value.setusername = e,
                    leading: const Icon(Icons.person_add_alt_1,
                        color: Color(0xffFF2156)),
                    hint: "Username"),
                PlainTextField(
                    onchanged: (String e) => value.setfullName = e,
                    leading: const Icon(Icons.person_add_alt_1,
                        color: Color(0xffFF2156)),
                    hint: "Full name"),
                PlainTextField(
                    onchanged: (e) => value.setphoneNumber = e,
                    leading: const Icon(Icons.phone, color: Color(0xffFF2156)),
                    hint: "Phone Number"),
                const YMargin(20),
                FormButton(
                    enabled: true,
                    text: "Update profile",
                    function: () {
                      value.updateProfile(context);
                    }),
                const YMargin(40),
              ]);
        }),
      ),
    );
  }
}

//------------------------------------------UPDATE PROFILE PROVIDER STARTS HERE
class UpdateProfileProvider extends BaseProvider {
  String? _username;
  String? _fullName;
  String? _phoneNumber;
  bool formValidity = false;

  String get username => _username ?? "";
  String get fullName => _fullName ?? '';
  String get phoneNumber => _phoneNumber ?? '';

  set setusername(String username) {
    _username = username;
    checkFormValidity();
    notifyListeners();
  }

  set setfullName(String fullName) {
    _fullName = fullName;
    checkFormValidity();
    notifyListeners();
  }

  set setphoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    checkFormValidity();
    notifyListeners();
  }

  void checkFormValidity() {
    if ((_username != null) && (_fullName != null) && (_phoneNumber != null)) {
      formValidity = true;
    } else {
      formValidity = false;
    }
    notifyListeners();
  }

  void updateProfile(BuildContext context) async {
    try {
      if (_username == null || _fullName == null) {
        Alerts.errorAlert(context, 'Al fields are required', () {
          Navigator.pop(context);
        });
      } else if (_fullName!.length < 1) {
        Alerts.errorAlert(context, 'fullName lengt too short', () {
          Navigator.pop(context);
        });
      } else {
        Alerts.loadingAlert(context, 'Updating profile...');
        FocusScope.of(context).unfocus();
        setLoading = true;
        var updateProfileResponse = await customerApiBasic.editProfile(
            userName: _username, fullName: _fullName, phoneNo: _phoneNumber);
        print("Weisle Update profile response is $updateProfileResponse");
        if (updateProfileResponse['resposeCode'] == '00') {
          setLoading = false;

          print('Request Successful');
          navigate(context, const LoginScreen());
        } else if (updateProfileResponse['resposeCode'] == '01') {
          Alerts.errorAlert(context, 'Invalid credentials', () {
            Navigator.pop(context);
          });
        } else {
          print("Weisle Update profile Response is $updateProfileResponse");
        }
      }
    } catch (e) {
      print("Weisle error: $e");
      Navigator.pop(context);
      Alerts.errorAlert(context, 'Something went Wrong', () {
        Navigator.pop(context);
      });
    }
  }

  UpdateProfileProvider() {
    checkFormValidity();
  }
}
