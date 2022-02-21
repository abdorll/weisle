import 'package:weisle/emergencySetup/setUp/setUp.dart';
import 'package:weisle/service/api_basics.dart';
import 'package:weisle/service/customers_apis.dart';
import 'package:weisle/service/emergency_apiBasics.dart';
import 'package:weisle/service/subscriptionApiBasic.dart';

ApiBasics apiBasics = ApiBasics();
CustomerApiBasi customerApiBasic = CustomerApiBasi(apiBasics);
EmergencyApiBasics emergencyApiBasics = EmergencyApiBasics(apiBasics);
SubscribtionApiBasic subscribtionApiBasic = SubscribtionApiBasic(apiBasics);

// LocalStorageService localStorageService = LocalStorageService();
CategoriesPage categoriesPage = CategoriesPage();
CategoriesProvider categoriesProvider = CategoriesProvider();

const weisleUserBox = 'weisleUserBox';
const weisleUserName = 'username';
const weisleId = 'weisle_ID';
const weislesetUpId = 'setUpId';
const weisleCurrency = 'weisleCurrency';
