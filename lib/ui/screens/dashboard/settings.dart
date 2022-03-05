// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:weisle/customer/referYourFriedns.dart';
import 'package:weisle/customer/resetPassword.dart';
import 'package:weisle/customer/sqaPage.dart';
import 'package:weisle/subscription/getSubHistory.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/navigtion.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: TextOf('More', 20, FontWeight.w500, white),
      ),
      body: SideSpace(
        10,
        10,
        SingleChildScrollView(
          child: Column(
            children: [
              SettingsContents(Icons.lock_clock_rounded, 'Reset password',
                  'Set a new password', () {
                navigate(context, const ResetPasword());
              }),
              const YMargin(10),
              SettingsContents(Icons.question_answer_rounded,
                  'Set security Q&A', 'Provide Q&A that pertains to you', () {
                navigate(context, const SQaPage());
              }),
              const YMargin(10),
              SettingsContents(Icons.format_align_justify_rounded,
                  'Account lookup', 'A summary of your details', () {}),
              const YMargin(10),
              const YMargin(10),
              SettingsContents(Icons.link_rounded, 'Referral code',
                  'Share your referral code with friends', () {
                navigate(context, const ReferYourFriends());
              }),
              const YMargin(10),
              SettingsContents(Icons.subscriptions_rounded,
                  'Subscription history', 'Detail of your sebscriptions', () {
                navigate(context, const GetSubscribtionHistoryPage());
              }),
              const YMargin(10),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsContents extends StatelessWidget {
  SettingsContents(this.icon, this.title, this.subtitle, this.action,
      {Key? key})
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
