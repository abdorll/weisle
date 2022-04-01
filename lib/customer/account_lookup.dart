// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:weisle/customer/sign_in.dart';
import 'package:weisle/helpers/Alerts.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/navigtion.dart';
import 'package:weisle/utils/base_provider.dart';
import 'package:weisle/utils/index.dart';

class AccountLookupPage extends StatefulWidget {
  const AccountLookupPage({Key? key}) : super(key: key);

  @override
  State<AccountLookupPage> createState() => _AccountLookupPageState();
}

class _AccountLookupPageState extends State<AccountLookupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorPrimary,
          title: TextOf('Account Lookup', 20, FontWeight.w500, white),
        ),
        body: SafeArea(
          child: SideSpace(
            10,
            10,
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<SignInProvider>(builder: ((context, value, child) {
                    return AccountLookupDetails('Username', value.username);
                  })),
                  const YMargin(10),
                  Consumer<SignInProvider>(builder: ((context, value, child) {
                    return AccountLookupDetails('Full name', value.fullName);
                  })),
                  const YMargin(10),
                  Consumer<SignInProvider>(builder: ((context, value, child) {
                    return AccountLookupDetails('Weizle Id', value.weisleId);
                  })),
                  const YMargin(10),
                  Consumer<SignInProvider>(builder: ((context, value, child) {
                    return AccountLookupDetails('Phone number', value.phoneNo);
                  })),
                  const YMargin(10),
                  Consumer<AccountLookupProvider>(
                      builder: ((context, value, child) {
                    return AccountLookupDetails(
                        'Security question', value.secQuestion);
                  })),
                  const YMargin(10),
                  Consumer<SignInProvider>(builder: ((context, value, child) {
                    return AccountLookupDetails(
                        'Your status', value.userStatus);
                  })),
                  const YMargin(10),
                  Consumer<SignInProvider>(builder: ((context, value, child) {
                    return AccountLookupDetails(
                        'Your referral code', value.referralCode);
                  })),
                  const YMargin(10),
                  Consumer<SignInProvider>(builder: ((context, value, child) {
                    return AccountLookupDetails(
                        'Account type', value.accountType);
                  })),
                ],
              ),
            ),
          ),
        ));
  }
}

class AccountLookupDetails extends StatelessWidget {
  String title;
  String subtitle;
  AccountLookupDetails(
    this.title,
    this.subtitle, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextOf(title, 20, FontWeight.w500, black),
        Card(
          color: white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: double.infinity,
            child: SideSpace(
                10,
                20,
                TextOfDecoration(
                    subtitle, 17, FontWeight.w300, black, TextAlign.left)),
          ),
        )
      ],
    );
  }
}

class AccountLookupProvider extends BaseProvider {
  String? _accountId;
  String? _phoneNo;
  String? _secQuestion;
  String? _userStatus;
  String get accountID => _accountId ?? '';
  String get phoneNo => _phoneNo ?? '';
  String get secQuestion => _secQuestion ?? 'Security question not set!';
  String get userStatus => _userStatus ?? '';

  set setAccountId(String accountId) {
    _accountId = accountId;
  }

  set setPhoneNo(String phoneNo) {
    _phoneNo = phoneNo;
  }

  set setSecQuestion(String secQuestion) {
    _secQuestion = secQuestion;
  }

  set setUsetStatus(String userStatus) {
    _userStatus = userStatus;
  }

  void accountLookup(BuildContext context) async {
    var box = await Hive.openBox(weisleUserBox);
    setAccountId = box.get(weisleUserName);
    setPhoneNo = box.get(weislephoneNumber);
    try {
      setLoading = true;
      Alerts.loadingAlert(context, 'Looking up acct...');
      var accountLookup = await customerApiBasic.acctLookup(
          accountId: _accountId, phoneNo: _phoneNo);
      setLoading = false;
      goBack(context);
      if (accountLookup.status == true) {
        box.put(weisleSecQuestion, accountLookup.data['data']['secQuestion']);
        box.put(weislesubStatus, accountLookup.data['data']['Active']);
        setSecQuestion = box.get(weisleSecQuestion);
        navigate(context, const AccountLookupPage());
      } else {
        print('Unable to lookup account');
      }
    } catch (e) {
      print('Weisle error this occurred: $e');
      goBack(context);
      Alerts.errorAlert(context, 'Error occured: $e', goBack(context));
    }
  }

  AccountLookupProvider(context) {
    accountLookup(context);
  }
}
