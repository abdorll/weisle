import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:weisle/helpers/Alerts.dart';
import 'package:weisle/subscription/getSubHistory.dart';
import 'package:weisle/ui/widgets/navigtion.dart';
import 'package:weisle/utils/base_provider.dart';
import 'package:weisle/utils/index.dart';

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
    setaccountId = accountID;
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
        if (confirmSubscriptionResponse.status == true) {
          print(subId);
          setLoading = false;
          goBack(context);
          print('Request Successful');
          Alerts.successAlert(context, 'Subscription Approved Successfully',
              () {
            goBack(context);
          });
        } else {
          goBack(context);
          Alerts.errorAlert(context, confirmSubscriptionResponse.message!, () {
            Navigator.pop(context);
          });
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
