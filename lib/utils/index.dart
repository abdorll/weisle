import 'package:weisle/customer/updateProfile.dart';
import 'package:weisle/emergencySetup/setUp/PLANgetPremium.dart';
import 'package:weisle/emergencySetup/setUp/categorySetup.dart';
import 'package:weisle/service/api_basics.dart';
import 'package:weisle/service/customers_apis.dart';
import 'package:weisle/service/emergency_apiBasics.dart';
import 'package:weisle/service/subscriptionApiBasic.dart';
import 'package:weisle/utils/user_details_getter.dart';

ApiBasics apiBasics = ApiBasics();
CustomerApiBasi customerApiBasic = CustomerApiBasi(apiBasics);
EmergencyApiBasics emergencyApiBasics = EmergencyApiBasics(apiBasics);
SubscribtionApiBasic subscribtionApiBasic = SubscribtionApiBasic(apiBasics);
PremiumPlansProvider premiumPlansProvider = PremiumPlansProvider();
// LocalStorageService localStorageService = LocalStorageService();
CategoriesPage categoriesPage = CategoriesPage();
CategoriesProvider categoriesProvider = CategoriesProvider();
//UserDetailsGetter userDetailsGetter = UserDetailsGetter();
UpdateProfileProvider updateProfileProvider = UpdateProfileProvider();

const weisleUserBox = 'weisleUserBox';
//--------------------LOGIN RELATED DETAILS
const weisleId = 'weizleId';
const weisleFullName = 'fullName';
const weislephoneNumber = 'phoneNumber';
const weisleUserName = 'username';
const isLoggedInUser = 'isLoggedInUser';

const weisleaccountType = 'accountType';
const weislesetUpId = 'setUpId';
const weislemyRefCode = 'myRefCode';
const weisleuserStatus = 'userStatus';
//--------------------REGISTER RELATED DETAILS
const rweisleReferral = 'Rreferral';
const rweisleId = 'rweizleId';
const weisleCurrency = 'weisleCurrency';
const rweisleFullName = 'rfullName';
const rweislephoneNumber = 'rphoneNumber';
const rweisleUserName = 'rusername';
const rweisleaccountType = 'raccountType';
const rweislesetUpId = 'rsetUpId';
const rweislemyrefCode = 'rmyrefCode';
const rweisleuserStatus = 'ruserStatus';
const rweislemyRefCode = 'rweislemyRefCode';
//-------------------------SET SQA
const weisleSecurityAnswer = 'weisleSecurityAnswer';
//-----------------------SUB HISTORY BY DATE
const weisleid = 'id';
const weislecreatedDate = 'createdDate';
const weisletxtRef = 'txtRef';
const weisleplanAmt = 'planAmt';
const weisleplanCurrency = 'planCurrency';
const weisleemergencyCountry = 'emergencyCountry';
const weislesubStatus = 'subStatus';

const weisleSecQuestion = "weisleSecQuestion";
const weisleAccountStatus = "weisleAccountStatus";
