import "package:weisle/service/api_basics.dart";
import "package:weisle/utils/endpoints.dart";

class CustomerApiBasi {
  ApiBasics? _apiBasics;
  static final customerApiBasi = CustomerApiBasi.createInstance();
  CustomerApiBasi.createInstance();
  factory CustomerApiBasi(ApiBasics apiBasics) {
    customerApiBasi._apiBasics = apiBasics;
    return customerApiBasi;
  }

  //------------------------------------------REGISTER ENDOINT CALLING
  Future register({fullName, phoneNo, userName, userPass, regCode}) {
    var data = {
      "fullName": fullName,
      "phoneNo": phoneNo,
      "userName": userName,
      "userPass": userPass,
      "regCode": regCode,
    };
    return _apiBasics!.makePostRequeest(registerurl, null, data);
  }

  //-------------------------------------------SIGN IN ENDOINT CALLING
  Future signIn({username, password}) {
    var data = {
      "username": username,
      "password": password,
    };
    return _apiBasics!.makePostRequeest(signInurl, null, data);
  }

  Future setSqa({userName, secQuestion, secAnswer}) {
    var data = {
      "userName": userName,
      "secQuestion": secQuestion,
      "secAnswer": secAnswer,
    };
    return _apiBasics!.makePostRequeest(setSqaurl, null, data);
  }

  Future acctLookup({accountId}) {
    var data = {
      "accountId": accountId,
    };
    return _apiBasics!.makePostRequeest(acctLookupurl, null, data);
  }

  Future resetPass({userName, secAnswer, userPass}) {
    var data = {
      "userName": userName,
      "secAnswer": secAnswer,
      "userPass": userPass,
    };
    return _apiBasics!.makePostRequeest(resetPassurl, null, data);
  }

  Future editProfile({userName, fullName, phoneNo}) {
    var data = {
      "userName": userName,
      "fullName": fullName,
      "phoneNo": phoneNo,
    };
    return _apiBasics!.makePostRequeest(editProfileurl, null, data);
  }

  Future notificationService(
      {accountId,
      emergencySetupId,
      emergencyState,
      emergencyCity,
      longitude,
      latitude,
      fullAddress,
      emergencyCountry}) {
    var data = {
      "accountId": accountId,
      "emergencySetupId": emergencySetupId,
      "emergencyState": emergencyState,
      "emergencyCity": emergencyCity,
      "longitude": longitude,
      "latitude": latitude,
      "fullAddress": fullAddress,
      "emergencyCountry": emergencyCountry,
    };
    return _apiBasics!.makePostRequeest(notificationServiceurl, null, data);
  }

  Future getNotification({userName}) {
    return _apiBasics!.makeGetRequest(getNotificationurl + userName, null);
  }
}
