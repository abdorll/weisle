import 'package:hive/hive.dart';
import 'package:weisle/service/api_basics.dart';
import 'package:weisle/utils/endpoints.dart';
import 'package:weisle/utils/index.dart';

class SubscribtionApiBasic {
  ApiBasics? _apiBasics;
  static final SubscribtionApiBasic _subscribtionApiBasic =
      SubscribtionApiBasic.createInstance();
  SubscribtionApiBasic.createInstance();
  factory SubscribtionApiBasic(ApiBasics apiBasics) {
    _subscribtionApiBasic._apiBasics = apiBasics;
    return _subscribtionApiBasic;
  }

  Future subHistoryByDate({startDate, endDate, accountId}) {
    Map<String, dynamic> data = {
      "startDate": startDate,
      "endDate": endDate,
      "accountId": accountId
    };
    return apiBasics.makePostRequest(subHistoryByDateurl, null, data);
  }

  Future getSubHistory() async {
    var userBox = await Hive.openBox(weisleUserBox);
    String accountId = userBox.get(weisleUserName);
    return apiBasics.makeGetRequest("$allSubHistoryurl$accountId", null);
  }
}
