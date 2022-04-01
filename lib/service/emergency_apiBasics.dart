import 'package:hive/hive.dart';
import 'package:weisle/service/api_basics.dart';
import 'package:weisle/utils/endpoints.dart';
import 'package:weisle/utils/index.dart';
import 'package:weisle/models.dart';

class EmergencyApiBasics {
  ApiBasics? _apiBasics;
  static final EmergencyApiBasics _emergencyApiBasics =
      EmergencyApiBasics.createInstance();
  EmergencyApiBasics.createInstance();
  factory EmergencyApiBasics(ApiBasics apiBasics) {
    _emergencyApiBasics._apiBasics = apiBasics;
    return _emergencyApiBasics;
  }

  //------------------GET CATEGORIES
  //------------------GET CATEGORIES
  //------------------GET CATEGORIES
  Future<ServiceResponse> getCategories() async{
    var response = await apiBasics.makeGetRequest(getAllCategoriesurl, null);
    return ServiceResponse.fromJSON(response.toJSON());
  }

  //------------------SET UP
  //------------------SET UP
  //------------------SET UP

  Future setUp(
      {accountId, emergencyCat, emergencyMsg, userNames, userContacts}) {
    Map<String, dynamic> data = {
      "accountId": accountId,
      "emergencyCat": emergencyCat,
      "emergencyMsg": emergencyMsg,
      "userNames": userNames,
      "userContacts": userContacts
    };
    return apiBasics.makePostRequest(setupEmergurl, null, data);
  }

  //------------------CREATE SUBSCRIPTION
  //------------------CREATE SUBSCRIPTION
  //------------------CREATE SUBSCRIPTION

  Future<ServiceResponse> createSubscription(
      {accountId,
      emergencySetupId,
      countryName,
      phoneNumber,
      premiumPlanId,
      planAmt,
      planCurrency}) async{
    Map<String, dynamic> data = {
      "accountId": accountId,
      "emergencySetupId": emergencySetupId,
      "countryName": countryName,
      "phoneNumber": phoneNumber,
      "premiumPlanId": premiumPlanId,
      "planAmt": planAmt,
      "planCurrency": planCurrency
    };
    var response = await apiBasics.makePostRequest(createSuburl, null, data);
    return ServiceResponse.fromJSON(response.toJSON());
  }

  //------------------CONFIRM SUBSCRIPTION
  //------------------CONFIRM SUBSCRIPTION
  //------------------CONFIRM SUBSCRIPTION

  Future<ServiceResponse> confirmSubscription({accountId, subId, txtRef, paymentStatus}) async{
    Map<String, dynamic> data = {
      "accountId": accountId,
      "SubId": subId,
      "txtRef": txtRef,
      "paymentStatus": paymentStatus,
    };
    var response = await apiBasics.makePostRequest(confirmSubPlnurl, null, data);
    return ServiceResponse.fromJSON(response.toJSON());
    
  }

  //--------------GET PREMIUM PLAN
  //--------------GET PREMIUM PLAN
  //--------------GET PREMIUM PLAN
  Future<ServiceResponse> getPremiumPlan() async {
    var userBox = await Hive.openBox(weisleUserBox);
    var currency = userBox.get(weisleCurrency);
    var response = await apiBasics.makeGetRequest("$premiumPlanurl/NGN", null);
    return ServiceResponse.fromJSON(response.toJSON());
  }
}
