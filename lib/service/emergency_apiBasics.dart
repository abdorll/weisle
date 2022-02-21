import 'package:hive/hive.dart';
import 'package:weisle/service/api_basics.dart';
import 'package:weisle/utils/endpoints.dart';
import 'package:weisle/utils/index.dart';

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
  Future getCategories() {
    return apiBasics.makeGetRequest(getAllCategoriesurl, null);
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

  Future createSubscription(
      {accountId,
      emergencySetupId,
      countryName,
      phoneNumber,
      premiumPlanId,
      planAmt,
      planCurrency}) {
    Map<String, dynamic> data = {
      "accountId": accountId,
      "emergencySetupId": emergencySetupId,
      "countryName": countryName,
      "phoneNumber": phoneNumber,
      "premiumPlanId": premiumPlanId,
      "planAmt": planAmt,
      "planCurrency": planCurrency
    };
    return apiBasics.makePostRequest(setupEmergurl, null, data);
  }

  //------------------CONFIRM SUBSCRIPTION
  //------------------CONFIRM SUBSCRIPTION
  //------------------CONFIRM SUBSCRIPTION

  Future confirmSubscription({accountId, subId, txtRef, paymentStatus}) {
    Map<String, dynamic> data = {
      "accountId": accountId,
      "SubId": subId,
      "txtRef": txtRef,
      "paymentStatus": paymentStatus,
    };
    return apiBasics.makePostRequest(setupEmergurl, null, data);
  }

  //--------------GET PREMIUM PLAN
  //--------------GET PREMIUM PLAN
  //--------------GET PREMIUM PLAN
  Future getPremiumPlan() async {
    var userBox = await Hive.openBox(weisleUserBox);
    var currency = userBox.get(weisleCurrency);
    return apiBasics.makeGetRequest("$premiumPlanurl/$currency", null);
  }
}
