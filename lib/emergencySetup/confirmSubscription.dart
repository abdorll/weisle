import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:weisle/helpers/Alerts.dart';
import 'package:weisle/subscription/getSubHistory.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/screens/dashboard/landing_screen.dart';
import 'package:weisle/ui/widgets/navigtion.dart';
import 'package:weisle/utils/base_provider.dart';
import 'package:weisle/utils/index.dart';
import 'package:provider/provider.dart';
import 'package:weisle/ui/widgets/custom_fields.dart';
import 'package:weisle/ui/widgets/form_button.dart';
import 'package:weisle/ui/widgets/margin.dart';

// class ConfirmSubscriptionPage extends StatefulWidget {
//   const ConfirmSubscriptionPage({Key? key}) : super(key: key);

//   @override
//   _ConfirmSubscriptionPageState createState() =>
//       _ConfirmSubscriptionPageState();
// }

// class _ConfirmSubscriptionPageState extends State<ConfirmSubscriptionPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: white,
//       body: SafeArea(
//         child: Consumer<ConfirmSubscriptionServiceProvider>(
//             builder: (context, value, child) {
//           return ListView(
//               padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
//               children: [
//                 SizedBox(
//                     height: 163,
//                     width: 129,
//                     child: Image.asset("assets/images/signIn.png")),
//                 PlainTextField(
//                     onchanged: (String e) => value.setaccountId = e,
//                     leading: const Icon(Icons.remember_me_rounded,
//                         color: Color(0xffFF2156)),
//                     hint: "Account ID"),
//                 PlainTextField(
//                     onchanged: (String e) => value.setpaymentStatus = e,
//                     leading: const Icon(Icons.phone_android_rounded,
//                         color: Color(0xffFF2156)),
//                     hint: "Paymet status"),
//                 PlainTextField(
//                     onchanged: (e) => value.setsubId = e,
//                     leading: const Icon(Icons.payment_rounded,
//                         color: Color(0xffFF2156)),
//                     hint: "Subscription ID"),
//                 PlainTextField(
//                     onchanged: (e) => value.settxtRef = e,
//                     leading: const Icon(Icons.text_fields_rounded,
//                         color: Color(0xffFF2156)),
//                     hint: "Text ref"),
//                 const YMargin(20),
//                 FormButton(
//                     enabled: true,
//                     text: "Complete confirmation",
//                     function: () {
//                       value.confirmSubscription(context);
//                     }),
//                 const YMargin(40),
//               ]);
//         }),
//       ),
//     );
//   }
// }

class ConfirmSubscriptionServiceProvider extends BaseProvider {
  String? _accountId;
  String? _subId;
  String? _txtRef;
  String? _paymentStatus;
  bool formValidity = false;

  String get accountId => _accountId ?? "";
  String get subId => _subId ?? '';
  String get txtRef => _txtRef ?? '';
  String get paymentStatus => _paymentStatus ?? "";

  set setaccountId(String accountId) {
    _accountId = accountId;
    checkFormValidity();
    notifyListeners();
  }

  set setsubId(String subId) {
    _subId = subId;
    checkFormValidity();
    notifyListeners();
  }

  set settxtRef(String txtRef) {
    _txtRef = txtRef;
    checkFormValidity();
    notifyListeners();
  }

  set setpaymentStatus(String paymentStatus) {
    _paymentStatus = paymentStatus;
    checkFormValidity();
    notifyListeners();
  }

  void checkFormValidity() {
    if ((_accountId != null) &&
        (_subId != null) &&
        (_txtRef != null) &&
        (_paymentStatus != null)) {
      formValidity = true;
    } else {
      formValidity = false;
    }
    notifyListeners();
  }

  void confirmSubscription(BuildContext context) async {
    var box = await Hive.openBox(weisleUserBox);
    String accountID = box.get(weisleUserName);
    String subID = box.get(weislemyRefCode) ??
        box.get(rweislemyRefCode) ??
        '6223A1CD2237C';
    setaccountId = accountID;
    setsubId = subID;

    try {
      setpaymentStatus = 'Approved';
      if (_accountId == null) {
        Alerts.errorAlert(context, 'Account ID is required', () {
          Navigator.pop(context);
        });
      } else if (_subId == null) {
        Alerts.errorAlert(context, 'SUB ID is required', () {
          Navigator.pop(context);
        });
      } else if (_txtRef == null) {
        Alerts.errorAlert(context, 'Text ref is required', () {
          Navigator.pop(context);
        });
      } else if (_paymentStatus == null) {
        Alerts.errorAlert(context, 'Payment status is required', () {
          Navigator.pop(context);
        });
      } else {
        Alerts.loadingAlert(context, 'Confirming...');
        FocusScope.of(context).unfocus();
        setLoading = true;

        var confirmSubscriptionResponse =
            await emergencyApiBasics.confirmSubscription(
                accountId: _accountId, //already set
                subId: _subId,
                txtRef: _txtRef,
                paymentStatus: _paymentStatus);
        print(
            "Weisle ConfirmSubscription service response is $confirmSubscriptionResponse");
        if (confirmSubscriptionResponse['resposeCode'] == '00') {
          setLoading = false;
          goBack(context);
          print('Request Successful');
          Alerts.successAlert(context, 'Confirmation successsful', () {
            goBack(context);
          });
        } else if (confirmSubscriptionResponse['resposeCode'] == '06') {
          Alerts.errorAlert(context, 'Improper format', () {
            Navigator.pop(context);
          });
        } else {
          print(
              "Weisle ConfirmSubscription Response is $confirmSubscriptionResponse");
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

  ConfirmSubscriptionServiceProvider() {
    checkFormValidity();
  }
}
