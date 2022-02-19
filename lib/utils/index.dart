import 'package:weisle/service/api_basics.dart';
import 'package:weisle/service/customers_apis.dart';
import 'package:weisle/service/emergency_apiBasics.dart';
import 'package:weisle/ui/screens/settings/setSqa.dart';
import 'package:weisle/utils/localStorage.dart';

ApiBasics apiBasics = ApiBasics();
CustomerApiBasi customerApiBasic = CustomerApiBasi(apiBasics);
EmergencyApiBasics emergencyApiBasics = EmergencyApiBasics(apiBasics);
// LocalStorageService localStorageService = LocalStorageService();
CategoriesPage categoriesPage = CategoriesPage();
CategoriesProvider categoriesProvider = CategoriesProvider();

const weisleUserBox = 'weisleUserBox';
const weisleUserName = 'username';
const weisleId = 'weisle_ID';
