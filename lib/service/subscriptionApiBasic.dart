import 'package:hive/hive.dart';
import 'package:weisle/customer/profile.dart';
import 'package:weisle/service/api_basics.dart';
import 'package:weisle/utils/endpoints.dart';
import 'package:weisle/utils/index.dart';
import 'package:weisle/models.dart';

class SubscribtionApiBasic {
  ApiBasics? _apiBasics;
  static final SubscribtionApiBasic _subscribtionApiBasic =
      SubscribtionApiBasic.createInstance();
  SubscribtionApiBasic.createInstance();
  factory SubscribtionApiBasic(ApiBasics apiBasics) {
    _subscribtionApiBasic._apiBasics = apiBasics;
    return _subscribtionApiBasic;
  }

  Future<ServiceResponse> subHistoryByDate(
      {startDate, endDate, accountId}) async {
    Map<String, dynamic> data = {
      "startDate": startDate,
      "endDate": endDate,
      "accountId": accountId
    };
    var response =
        await apiBasics.makePostRequest(subHistoryByDateurl, null, data);
    return ServiceResponse.fromJSON(response.toJSON());
  }

  Future<ServiceResponse> getSubHistory() async {
    var userBox = await Hive.openBox(weisleUserBox);
    String fullName = userBox.get(weisleFullName);
    String accountId = userBox.get(weisleUserName);
    var response =
        await apiBasics.makeGetRequest("$allSubHistoryurl/$accountId", null);
    return ServiceResponse.fromJSON(response.toJSON());
  }
}
