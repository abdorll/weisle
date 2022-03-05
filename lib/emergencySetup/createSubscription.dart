import 'package:flutter/material.dart';
import 'package:weisle/emergencySetup/firstPaymentMethod.dart';
import 'package:weisle/emergencySetup/setUp/PLANgetPremium.dart';
import 'package:weisle/helpers/Alerts.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/screens/dashboard/landing_screen.dart';
import 'package:weisle/ui/widgets/navigtion.dart';
import 'package:weisle/utils/base_provider.dart';
import 'package:weisle/utils/index.dart';
import 'package:provider/provider.dart';
import 'package:weisle/ui/widgets/custom_fields.dart';
import 'package:weisle/ui/widgets/form_button.dart';
import 'package:hive/hive.dart';
import 'package:weisle/ui/widgets/margin.dart';

class CreateSubscriptionPage extends StatefulWidget {
  const CreateSubscriptionPage({Key? key}) : super(key: key);

  @override
  _CreateSubscriptionPageState createState() => _CreateSubscriptionPageState();
}

class _CreateSubscriptionPageState extends State<CreateSubscriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Consumer<CreateSubscriptionServiceProvider>(
            builder: (context, value, child) {
          return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
              children: [
                SizedBox(
                    height: 163,
                    width: 129,
                    child: Image.asset("assets/images/signIn.png")),
                PlainTextField(
                    onchanged: (String e) => value.setaccountId = e,
                    leading: const Icon(Icons.remember_me_rounded,
                        color: Color(0xffFF2156)),
                    hint: "Account ID"),
                PlainTextField(
                    onchanged: (String e) => value.setphoneNumber = e,
                    leading: const Icon(Icons.phone_android_rounded,
                        color: Color(0xffFF2156)),
                    hint: "Phone number"),
                PlainTextField(
                    onchanged: (e) => value.setplanCurrency = e,
                    leading: const Icon(Icons.public_rounded,
                        color: Color(0xffFF2156)),
                    hint: "Plan currency"),
                PlainTextField(
                    onchanged: (e) => value.setemergencySetupId = e,
                    leading: const Icon(Icons.location_city_rounded,
                        color: Color(0xffFF2156)),
                    hint: "Emergency setup ID"),
                PlainTextField(
                    onchanged: (e) => value.setcountryName = e,
                    leading: const Icon(Icons.map, color: Color(0xffFF2156)),
                    hint: "Country name"),
                PlainTextField(
                    onchanged: (e) => value.setplanAmt = e,
                    leading: const Icon(Icons.location_on_rounded,
                        color: Color(0xffFF2156)),
                    hint: "Plan amount"),
                PlainTextField(
                    onchanged: (e) => value.setpremiumPlanId = e,
                    leading: const Icon(Icons.navigation_rounded,
                        color: Color(0xffFF2156)),
                    hint: "Premium plan ID"),
                const YMargin(20),
                FormButton(
                    enabled: true,
                    text: "Complete subscription",
                    function: () {
                      value.subscribe(context);
                    }),
                const YMargin(40),
              ]);
        }),
      ),
    );
  }
}

class CreateSubscriptionServiceProvider extends BaseProvider {
  String? _accountId;
  String? _emergencySetupId;
  String? _countryName;
  String? _phoneNumber;
  String? _premiumPlanId;
  String? _planAmt;
  String? _planCurrency;
  bool formValidity = false;

  String get accountId => _accountId ?? "";
  String get emergencySetupId => _emergencySetupId ?? '';
  String get countryName => _countryName ?? '';
  String get phoneNumber => _phoneNumber ?? "";
  String get premiumPlanId => _premiumPlanId ?? '';
  String get planAmt => _planAmt ?? '';
  String get planCurrency => _planCurrency ?? '';

  set setaccountId(String accountId) {
    _accountId = accountId;
    checkFormValidity();
    notifyListeners();
  }

  set setemergencySetupId(String emergencySetupId) {
    _emergencySetupId = emergencySetupId;
    checkFormValidity();
    notifyListeners();
  }

  set setcountryName(String countryName) {
    _countryName = countryName;
    checkFormValidity();
    notifyListeners();
  }

  set setphoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    checkFormValidity();
    notifyListeners();
  }

  set setpremiumPlanId(String premiumPlanId) {
    _premiumPlanId = premiumPlanId;
    checkFormValidity();
    notifyListeners();
  }

  set setplanAmt(String planAmt) {
    _planAmt = planAmt;
    checkFormValidity();
    notifyListeners();
  }

  set setplanCurrency(String planCurrency) {
    _planCurrency = planCurrency;
    checkFormValidity();
    notifyListeners();
  }

  void countryNamePhoneNumberCheck(context) {
    if (_countryName == null || _phoneNumber == null) {
      Alerts.errorAlert(
          context, 'Valid country name and phone number are required', () {
        Navigator.pop(context);
      });
    } else {
      Future.delayed(Duration(seconds: 2), () {
        navigate(context, GetAnotherWeizlePremium());
      });
    }
  }

  void checkFormValidity() {
    if ((_accountId != null) &&
        (_emergencySetupId != null) &&
        (_countryName != null) &&
        (_premiumPlanId != null) &&
        (_phoneNumber != null) &&
        (_planAmt != null) &&
        (_planCurrency != null)) {
      formValidity = true;
    } else {
      formValidity = false;
    }
    notifyListeners();
  }

  void subscribe(BuildContext context) async {
    setplanAmt = GetAnotherWeizlePremium.planAmt;
    setplanCurrency = GetAnotherWeizlePremium.planCurrency;
    setpremiumPlanId = GetAnotherWeizlePremium.premiumPlanId;
    var userBox = await Hive.openBox(weisleUserBox);
    String accountIDD = userBox.get(weisleUserName);
    String setupIDD = userBox.get(weislesetUpId);
    setaccountId = accountIDD;
    setemergencySetupId = setupIDD;
    try {
      if (_accountId == null ||
          _emergencySetupId == null ||
          _countryName == null ||
          _phoneNumber == null ||
          _premiumPlanId == null ||
          _planAmt == null ||
          _planCurrency == null) {
        Alerts.errorAlert(context, 'All fields are required', () {
          Navigator.pop(context);
        });
      } else {
        Alerts.loadingAlert(context, 'Proccessing sub...');
        FocusScope.of(context).unfocus();
        setLoading = true;
        var subscriptionServiceResponse =
            await emergencyApiBasics.createSubscription(
          accountId: _accountId,
          emergencySetupId: _emergencySetupId,
          countryName: _countryName,
          phoneNumber: _phoneNumber,
          premiumPlanId: _premiumPlanId,
          planAmt: _planAmt,
          planCurrency: _planCurrency,
        );
        print(
            "Weisle CreateSubscription service response is $subscriptionServiceResponse");
        if (subscriptionServiceResponse['resposeCode'] == '00') {
          setLoading = false;
          Alerts.successAlert(context, 'Subscription successfully created', () {
            navigateReplaces(context, LandingScreen());
          });
          print('Request Successful');
        } else if (subscriptionServiceResponse['resposeCode'] == '06') {
          Alerts.errorAlert(context, 'Improper format', () {
            Navigator.pop(context);
          });
        } else {
          print(
              "Weisle CreateSubscription Response is $subscriptionServiceResponse");
        }
      }
    } catch (e) {
      print("Weisle error: $e");
      Navigator.pop(context);
      Alerts.errorAlert(context, 'Something went Wrong', () {
        Navigator.pop(context);
      });
    }
  }

  CreateSubscriptionServiceProvider() {
    checkFormValidity();
  }
}
