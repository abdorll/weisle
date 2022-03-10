// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:weisle/helpers/Alerts.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/screens/activity_report.dart';
import 'package:weisle/ui/screens/dashboard/landing_screen.dart';
import 'package:weisle/ui/widgets/navigtion.dart';
import 'package:weisle/utils/base_provider.dart';
import 'package:weisle/utils/index.dart';
import 'package:provider/provider.dart';
import 'package:weisle/ui/widgets/custom_fields.dart';
import 'package:weisle/ui/widgets/form_button.dart';
import 'package:weisle/ui/widgets/margin.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Consumer<NotificationServiceProvider>(
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
                    onchanged: (String e) => value.setemergencyCity = e,
                    leading: const Icon(Icons.apartment_rounded,
                        color: Color(0xffFF2156)),
                    hint: "Emergency city"),
                PlainTextField(
                    onchanged: (e) => value.setemergencyCountry = e,
                    leading: const Icon(Icons.public_rounded,
                        color: Color(0xffFF2156)),
                    hint: "Emergency country"),
                PlainTextField(
                    onchanged: (e) => value.setemergencySetupId = e,
                    leading: const Icon(Icons.location_city_rounded,
                        color: Color(0xffFF2156)),
                    hint: "Emergency setup ID"),
                PlainTextField(
                    onchanged: (e) => value.setemergencyState = e,
                    leading: const Icon(Icons.map, color: Color(0xffFF2156)),
                    hint: "Emergency state"),
                PlainTextField(
                    onchanged: (e) => value.setfullAddress = e,
                    leading: const Icon(Icons.location_on_rounded,
                        color: Color(0xffFF2156)),
                    hint: "Full address"),
                PlainTextField(
                    onchanged: (e) => value.setlongitude = e,
                    leading: const Icon(Icons.navigation_rounded,
                        color: Color(0xffFF2156)),
                    hint: "Longitude"),
                PlainTextField(
                    onchanged: (e) => value.setlatitude = e,
                    leading: const Icon(Icons.near_me_rounded,
                        color: Color(0xffFF2156)),
                    hint: "Latitude"),
                const YMargin(20),
                FormButton(
                    enabled: true,
                    text: "Complete notification",
                    function: () {
                      value.notoficationService(context);
                    }),
                const YMargin(40),
              ]);
        }),
      ),
    );
  }
}

class NotificationServiceProvider extends BaseProvider {
  String? _accountId;
  String? _emergencySetupId;
  String? _emergencyState;
  String? _emergencyCity;
  String? _longitude;
  String? _fullAddress;
  String? _emergencyCountry;
  String? _latitude;
  bool formValidity = false;

  String get accountId => _accountId ?? "";
  String get emergencySetupId => _emergencySetupId ?? '';
  String get emergencyState => _emergencyState ?? '';
  String get emergencyCity => _emergencyCity ?? "";
  String get longitude => _longitude ?? '';
  String get fullAddress => _fullAddress ?? '';
  String get emergencyCountry => _emergencyCountry ?? '';
  String get latitude => _latitude ?? '';

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

  set setemergencyState(String emergencyState) {
    _emergencyState = emergencyState;
    checkFormValidity();
    notifyListeners();
  }

  set setemergencyCity(String emergencyCity) {
    _emergencyCity = emergencyCity;
    checkFormValidity();
    notifyListeners();
  }

  set setlongitude(String longitude) {
    _longitude = longitude;
    checkFormValidity();
    notifyListeners();
  }

  set setfullAddress(String fullAddress) {
    _fullAddress = fullAddress;
    checkFormValidity();
    notifyListeners();
  }

  set setemergencyCountry(String emergencyCountry) {
    _emergencyCountry = emergencyCountry;
    checkFormValidity();
    notifyListeners();
  }

  set setlatitude(String latitude) {
    _latitude = latitude;
    checkFormValidity();
    notifyListeners();
  }

  void checkFormValidity() {
    if ((_accountId != null) &&
        (_emergencySetupId != null) &&
        (_emergencyState != null) &&
        (_longitude != null) &&
        (_emergencyCity != null) &&
        (_fullAddress != null) &&
        (_emergencyCountry != null) &&
        (_latitude != null)) {
      formValidity = true;
    } else {
      formValidity = false;
    }
    notifyListeners();
  }

  void notoficationService(BuildContext context) async {
    var box = await Hive.openBox(weisleUserBox);
    String accountId = box.get(weisleUserName);
    String setupIDD = box.get(weislesetUpId) ?? '656975794574';
    setaccountId = accountId;
    setemergencySetupId = setupIDD;
    try {
      if (_accountId == null ||
          _emergencySetupId == null ||
          _emergencyState == null ||
          _emergencyCity == null ||
          _longitude == null ||
          _fullAddress == null ||
          _emergencyCountry == null ||
          _latitude == null) {
        Alerts.errorAlert(context, 'All fields are required', () {
          Navigator.pop(context);
        });
      } else if (_emergencySetupId!.length < 1) {
        Alerts.errorAlert(context, 'Emergency Setup Id lengt too short', () {
          Navigator.pop(context);
        });
      } else {
        Alerts.loadingAlert(context, 'Progressing notif...');
        FocusScope.of(context).unfocus();
        setLoading = true;
        var notoficationServiceResponse =
            await customerApiBasic.notificationService(
          accountId: _accountId,
          emergencySetupId: _emergencySetupId,
          emergencyState: _emergencyState,
          emergencyCity: _emergencyCity,
          longitude: _longitude,
          fullAddress: _fullAddress,
          emergencyCountry: _emergencyCountry,
          latitude: _latitude,
        );
        print(
            "Weisle Notification service response is $notoficationServiceResponse");
        if (notoficationServiceResponse['resposeCode'] == '00') {
          setLoading = false;
          print('Request Successful');
          Alerts.successAlert(context, 'Notification succssfully set', () {
            navigatedForever(context, const MakeReport());
          });
        } else if (notoficationServiceResponse['resposeCode'] == '06') {
          Alerts.errorAlert(context, 'Emergency setup is inactive', () {
            Navigator.pop(context);
          });
        } else {
          print("Weisle Notification Response is $notoficationServiceResponse");
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

  NotificationServiceProvider() {
    checkFormValidity();
  }
}
