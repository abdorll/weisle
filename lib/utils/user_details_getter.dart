// // ignore_for_file: prefer_typing_uninitialized_variables

import 'package:hive/hive.dart';
import 'package:weisle/utils/base_provider.dart';
import 'package:weisle/utils/index.dart';

class UserDetailsGetter extends BaseProvider {
  String? _fullName;
  String? _accountType;
  String? _username;
  String? _allUsernames;
  String? _referralCode;
  String? _weisleId;
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
  String get allUsernames => _allUsernames ?? '-nothing added yet!-';
  String get accountType => _accountType ?? 'accountType';
  String get weisleId => _weisleId ?? 'weisleId';

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

  set setusername(String username) {
    _username = username;
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

  set setAllUsernames(String allusernames) {
    _allUsernames = allusernames;
    notifyListeners();
  }

  void getUserDetails() async {
    var userBox = await Hive.openBox(weisleUserBox);
    setusername = userBox.get(weisleUserName);
    setuserloggedIn = userBox.get(isLoggedInUser);
    setweisleId = userBox.get(weisleId) ?? userBox.get(weisleid);
    setfullName = userBox.get(weisleFullName);
    setaccountType = userBox.get(weisleaccountType);
    setreferralCode = userBox.get(weislemyRefCode);
    setAllUsernames = userBox.get(weisleusernames);
    //---------------------------------FROM SUB HISTORY BY DATE
    setid = userBox.get(weisleId);
    settxtRef = userBox.get(weisletxtRef);
    setplanAmt = userBox.get(weisleplanAmt);
    setplanCurrency = userBox.get(weisleplanCurrency);
    setemergencyCountry = userBox.get(weisleemergencyCountry);
    setsubStatus = userBox.get(weislesubStatus);
    setcreatedDate = userBox.get(weislecreatedDate);
  }

  UserDetailsGetter() {
    getUserDetails();
  }
}
