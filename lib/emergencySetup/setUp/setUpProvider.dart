// ignore_for_file: unrelated_type_equality_checks, unused_local_variable
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:weisle/helpers/alerts.dart';
import 'package:weisle/customer/accountLookup.dart';
import 'package:weisle/ui/widgets/navigtion.dart';
import 'package:weisle/utils/base_provider.dart';
import 'package:weisle/utils/index.dart';

//-----------------------------------------SetUpProvider PROVIDER
class SetUpProvider extends BaseProvider {
  //String? _accountId;
  String? _emergencyCat;
  String? _emergencyMsg;
  String? _userNames;
  String? _userContacts;

  bool formValidity = false;

  //String get accountId => _accountId ?? '';
  String get emergencyCat => _emergencyCat ?? '';
  String get emergencyMsg => _emergencyMsg ?? '';
  String get userNames => _userNames ?? '';
  String get userContacts => _userContacts ?? '';

  // set setaccountId(String accountId) {
  //   _accountId = accountId;
  //   checkFormValidity();
  //   notifyListeners();
  // }

  set setemergencyCat(String emergencyCat) {
    _emergencyCat = emergencyCat;
    checkFormValidity();
    notifyListeners();
  }

  set setemergencyMsg(String emergencyMsg) {
    _emergencyMsg = emergencyMsg;
    checkFormValidity();
    notifyListeners();
  }

  set setuserNames(String userNames) {
    _userNames = userNames;
    checkFormValidity();
    notifyListeners();
  }

  set setuserContacts(String userContacts) {
    _userContacts = userContacts;
    checkFormValidity();
    notifyListeners();
  }

  void checkFormValidity() {
    if (
        //(_accountId != null) &&

        (_emergencyCat != null) &&
            (_emergencyMsg != null) &&
            (_userNames != null) &&
            (_userContacts != null)) {
      formValidity = true;
    } else {
      formValidity = false;
    }
    notifyListeners();
  }

  void SetUp(BuildContext context) async {
    try {
      if (
          //_accountId == null ||

          _emergencyCat == null ||
              _emergencyMsg == null ||
              _userNames == null ||
              _userContacts == null) {
        Alerts.errorAlert(context, 'All fields are required', () {
          Navigator.pop(context);
        });
      } else {
        Alerts.loadingAlert(context, 'Setting up...');
        FocusScope.of(context).unfocus();
        setLoading = true;
        var box = await Hive.openBox(weisleUserBox);

        String accId = box.get(weisleUserName);
        var registerResponse = await emergencyApiBasics.setUp(
            accountId: accId,
            emergencyCat: _emergencyCat,
            emergencyMsg: _emergencyMsg,
            userNames: _userNames,
            userContacts: _userContacts);
        if (registerResponse['resposeCode'] == '00') {
          var setUpId = await box.get(weislesetUpId);
          setLoading = false;

          print('Request Successful');
          navigate(context, const AccountLookup());
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

  SetUpProvider() {
    checkFormValidity();
  }
}
