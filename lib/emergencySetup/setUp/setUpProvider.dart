// ignore_for_file: unrelated_type_equality_checks, unused_local_variable

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:weisle/emergencySetup/setUp/CONTACTGetPremiumPlan.dart';
import 'package:weisle/emergencySetup/setUp/PLANgetPremium.dart';
import 'package:weisle/emergencySetup/setUp/categorySetup.dart';
import 'package:weisle/emergencySetup/setUp/contactSetup.dart';
import 'package:weisle/helpers/alerts.dart';
import 'package:weisle/emergencySetup/setUp/accountLookup.dart';
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

  String? _contact1;
  String? _contact2;
  String? _contact3;

  bool formValidity = false;

  //String get accountId => _accountId ?? '';
  String get emergencyCat => _emergencyCat ?? '';
  String get emergencyMsg => _emergencyMsg ?? '';
  String get userNames => _userNames ?? '';
  String get userContacts => _userContacts ?? '';
  String get contact1 => _contact1 ?? '';
  String get contact2 => _contact2 ?? '';
  String get contact3 => _contact3 ?? '';

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

  set setcontact1(String contact1) {
    _contact1 = contact1;
    checkFormValidity();
    notifyListeners();
  }

  set setcontact2(String contact2) {
    _contact2 = contact2;
    notifyListeners();
  }

  set setcontact3(String contact3) {
    _contact3 = contact3;
    notifyListeners();
  }

  // void saveUserNames() async {
  //   var box = await Hive.openBox(weisleUserBox);
  //   var names = box.put('usernames', userNames);
  // }

  void checkFormValidity() {
    if ((_emergencyCat != null) &&
        (_emergencyMsg != null) &&
        (_userNames != null) &&
        (_userContacts != null)) {
      formValidity = true;
    } else {
      formValidity = false;
    }
    notifyListeners();
  }

  void emrgencyAndCategoryCheck(context) {
    setemergencyMsg = CategoriesPage.defaultMsg ?? "Emergency!!! Please";
    if (_emergencyCat == null || _emergencyMsg == null) {
      Alerts.errorAlert(context, 'Emergency category and message are required',
          () {
        Navigator.pop(context);
      });
    } else {
      navigate(context, const SetUsernamePage());
    }
  }

  void userNamesCheck(context) {
    if (_userNames == null) {
      Alerts.errorAlert(
          context, 'Add as many usernames you want, separated by commas', () {
        Navigator.pop(context);
      });
    } else {
      navigate(context, const ContactSetup());
    }
  }

  void setUp(BuildContext context) async {
    var box = await Hive.openBox(weisleUserBox);
    box.put(weisleusernames, userNames);

    try {
      if (_contact1 == null) {
        Alerts.errorAlert(context, 'Primary phone number is required', () {
          Navigator.pop(context);
        });
      } else {
        setuserContacts = "$contact1, $contact2, $contact3";
        Alerts.loadingAlert(context, 'Setting up...');
        FocusScope.of(context).unfocus();
        setLoading = true;
        var box = await Hive.openBox(weisleUserBox);

        String accId = box.get(rweisleUserName) ?? box.get(weisleUserName);
        var setupResponse = await emergencyApiBasics.setUp(
            accountId: accId,
            emergencyCat: _emergencyCat,
            emergencyMsg: _emergencyMsg,
            userNames: _userNames,
            userContacts: _userContacts);
        if (setupResponse.status == true) {
          setLoading = false;
          box.put(weislesetUpId, setupResponse.data['data']['setupId']);
          print('Request Successful');
          goBack(context);
          Alerts.successAlert(context, 'Emergency setup successful', () {
            navigatedForever(
                context, const GetWeizlePremiumContactAndCountyrPage());
          });
        } else {
          setLoading = false;
          goBack(context);
          Alerts.errorAlert(context, setupResponse.message, () {
            Navigator.pop(context);
          });
          // print("Weisle register Response is $setupResponse");
        } 
      }
    } catch (e) {
      setLoading = false;
      goBack(context);
      Alerts.errorAlert(context, 'Something went wrong $e', () {
        Navigator.pop(context);
      });
    }
  }

  SetUpProvider() {
    checkFormValidity();
  }
}
