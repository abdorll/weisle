import "package:weisle/service/api_basics.dart";
import "package:weisle/utils/endpoints.dart";
import "package:weisle/models.dart";

class CustomerApiBasi {
  ApiBasics? _apiBasics;
  static final customerApiBasi = CustomerApiBasi.createInstance();
  CustomerApiBasi.createInstance();
  factory CustomerApiBasi(ApiBasics apiBasics) {
    customerApiBasi._apiBasics = apiBasics;
    return customerApiBasi;
  }

  //------------------------------------------REGISTER ENDOINT CALLING
  Future<ServiceResponse> register (
      {String? fullName,
      String? phoneNo,
      String? userName,
      String? userPass,
      String? regCode}) async{
    Map<String, dynamic> data = {
      "fullName": fullName,
      "phoneNo": phoneNo,
      "userName": userName,
      "userPass": userPass,
      "regCode": regCode
    };
    var response = await _apiBasics!.makePostRequest(registerurl, null, data);
    return ServiceResponse.fromJSON(response.toJSON());
  }

  //-------------------------------------------SIGN IN
  Future<ServiceResponse> signIn({username, password}) async{
    Map<String, dynamic> data = {
      "username": username,
      "password": password,
    };
    var response = await _apiBasics!.makePostRequest(signInurl, null, data);
    return ServiceResponse.fromJSON(response.toJSON());
  }

  //-------------------------------------------SET SQA
  //-------------------------------------------SET SQA
  //-------------------------------------------SET SQA
  //-------------------------------------------SET SQA
  Future<ServiceResponse> setSqa({userName, secQuestion, secAnswer}) async{
    Map<String, dynamic> data = {
      "userName": userName,
      "secQuestion": secQuestion,
      "secAnswer": secAnswer,
    };
    var response = await _apiBasics!.makePostRequest(setSqaurl, null, data);
    return ServiceResponse.fromJSON(response.toJSON());
  }

  //-------------------------------------------ACCOUNT LOOKUP
  //-------------------------------------------ACCOUNT LOOKUP
  //-------------------------------------------ACCOUNT LOOKUP
  Future<ServiceResponse> acctLookup({accountId, phoneNo}) async{
    Map<String, dynamic> data = {
      "accountId": accountId,
      "phoneNo": phoneNo,
    };
    var response = await _apiBasics!.makePostRequest(acctLookupurl, null, data);
    return ServiceResponse.fromJSON(response.toJSON());
  }

  //-------------------------------------------RESET PASSWORD
  //-------------------------------------------RESET PASSWORD
  //-------------------------------------------RESET PASSWORD
  Future<ServiceResponse> resetPass({userName, secAnswer, userPass}) async{
    Map<String, dynamic> data = {
      "userName": userName,
      "secAnswer": secAnswer,
      "userPass": userPass,
    };
    var response = await _apiBasics!.makePostRequest(resetPassurl, null, data);
    return ServiceResponse.fromJSON(response.toJSON());
  }

  //-------------------------------------------EDIT PROFILE
  //-------------------------------------------EDIT PROFILE
  //-------------------------------------------EDIT PROFILE
  Future<ServiceResponse> editProfile({userName, fullName, phoneNo}) async{
    Map<String, dynamic> data = {
      "userName": userName,
      "fullName": fullName,
      "phoneNo": phoneNo,
    };
    var response = await _apiBasics!.makePostRequest(editProfileurl, null, data);
    return ServiceResponse.fromJSON(response.toJSON());
  }

  //-------------------------------------------NOTIFICATION SERVICE
  //-------------------------------------------NOTIFICATION SERVICE
  //-------------------------------------------NOTIFICATION SERVICE
  Future<ServiceResponse> notificationService({
    accountId,
    emergencySetupId,
    emergencyState,
    emergencyCity,
    longitude,
    latitude,
    fullAddress,
    emergencyCountry,
  }) async{
    Map<String, dynamic> data = {
      "accountId": accountId,
      "emergencySetupId": emergencySetupId,
      "emergencyState": emergencyState,
      "emergencyCity": emergencyCity,
      "longitude": longitude,
      "latitude": latitude,
      "fullAddress": fullAddress,
      "emergencyCountry": emergencyCountry,
    };
    var response = await _apiBasics!.makePostRequest(notificationServiceurl, null, data);
    return ServiceResponse.fromJSON(response.toJSON());
  }

  //-------------------------------------------GET NOTIFICATION
  //-------------------------------------------GET NOTIFICATION
  //-------------------------------------------GET NOTIFICATION
  Future<ServiceResponse> getNotification({userName}) async{
    var response = await _apiBasics!.makeGetRequest(getNotificationurl + userName, null);
    return ServiceResponse.fromJSON(response.toJSON());
  }
}
