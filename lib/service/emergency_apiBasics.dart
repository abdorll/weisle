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

  Future getCategories() {
    return apiBasics.makeGetRequest(getAllCategoriesurl, null);
  }
}
