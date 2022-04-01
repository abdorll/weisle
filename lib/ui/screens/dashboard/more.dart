// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weisle/customer/account_lookup.dart';
import 'package:weisle/customer/referYourFriedns.dart';
import 'package:weisle/customer/resetPassword.dart';
import 'package:weisle/customer/sqaPage.dart';
import 'package:weisle/emergencySetup/confirmSubscription.dart';
import 'package:weisle/subscription/getSubHistory.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/screens/first_aid_tips.dart';
import 'package:weisle/ui/screens/other_feautures.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/navigtion.dart';

class More extends StatelessWidget {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: IconOf(Icons.arrow_back_ios_rounded, white, 10),
          onTap: () {
            goBack(context);
          },
        ),
        backgroundColor: colorPrimary,
        title: TextOf('More', 20, FontWeight.w500, white),
      ),
      body: SideSpace(
        10,
        10,
        SingleChildScrollView(
          child: Column(
            children: [
              MoreContents(Icons.lock_clock_rounded, 'Reset password',
                  'Set a new password', () {
                navigate(context, const ResetPasword());
              }),
              const YMargin(10),
              MoreContents(Icons.question_answer_rounded, 'Set security Q&A',
                  'Provide Q&A that pertains to you', () {
                navigate(context, const SQaPage());
              }),
              const YMargin(10),
              Consumer<AccountLookupProvider>(
                  builder: ((context, value, child) {
                return MoreContents(Icons.format_align_justify_rounded,
                    'Account lookup', 'A summary of your details', () {
                  value.accountLookup(context);
                });
              })),
              const YMargin(10),
              const YMargin(10),
              MoreContents(Icons.link_rounded, 'Referral code',
                  'Share your referral code with friends', () {
                navigate(context, const ReferYourFriends());
              }),
              const YMargin(10),
              Consumer<GetSubHistoryProvider>(builder: (context, value, child) {
                return MoreContents(Icons.subscriptions_rounded,
                    'Subscription history', 'Detail of your sebscriptions', () {
                  value.getSubHistory();
                  navigate(context, const GetSubscribtionHistoryPage());
                });
              }),
              const YMargin(10),
              MoreContents(Icons.more_rounded, 'Other feautures',
                  'Set other feautures of Weisle', () {
                navigate(context, const OtherFeatures());
              }),
              const YMargin(10),
              MoreContents(Icons.medical_services_rounded, 'First aid tips',
                  'Tips on critical emergency situations', () {
                navigate(context, const FirstAidTips());
              }),
              const YMargin(10),
            ],
          ),
        ),
      ),
    );
  }
}

class MoreContents extends StatelessWidget {
  MoreContents(this.icon, this.title, this.subtitle, this.action, {Key? key})
      : super(key: key);
  IconData icon;
  Function action;
  String title;
  String subtitle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        action();
      },
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SideSpace(
            10,
            10,
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  child: IconOf(icon, white, 20),
                  decoration: BoxDecoration(
                      color: colorPrimary,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: colorPrimary)),
                ),
                const XMargin(10),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextOfDecoration(
                        title, 20, FontWeight.w600, black, TextAlign.start),
                    TextOfDecoration(
                        subtitle, 15, FontWeight.w400, black, TextAlign.start),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
