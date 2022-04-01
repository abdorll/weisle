// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:weisle/customer/resetPassword.dart';
import 'package:weisle/emergencySetup/createSubscription.dart';
import 'package:weisle/subscription/getSubHistory.dart';
import 'package:weisle/utils/base_provider.dart';
import 'package:weisle/utils/index.dart';
import 'package:weisle/emergencySetup/firstPaymentMethod.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/navigtion.dart';

class GetAnotherWeizlePremium extends StatefulWidget {
  static var premiumPlanId;
  static var planAmt;
  static var planCurrency;

  const GetAnotherWeizlePremium({Key? key}) : super(key: key);

  @override
  _GetAnotherWeizlePremiumState createState() =>
      _GetAnotherWeizlePremiumState();
}

class _GetAnotherWeizlePremiumState extends State<GetAnotherWeizlePremium> {
  String planiddd = '0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
        child: Consumer<PremiumPlansProvider>(builder: (context, value, child) {
      return !value.loading
          ? SideSpace(
              10,
              10,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Header(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconOf(Icons.crop_square_rounded, colorPrimary, 20),
                      TextOf('Set up payment to renew automatically', 15,
                          FontWeight.w400, ash)
                    ],
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.premiumPlanList.length,
                      itemBuilder: (context, int indexPosition) {
                        GetPremiumPlanModel singlePlan =
                            value.premiumPlanList[indexPosition];
                        String days = singlePlan.id == '1'
                            ? '30'
                            : singlePlan.id == '2'
                                ? '90'
                                : singlePlan.id == '3'
                                    ? '360'
                                    : '0';
                        Widget leading() {
                          planiddd == singlePlan.id;
                          GetAnotherWeizlePremium.planAmt =
                              singlePlan.planAmount;
                          GetAnotherWeizlePremium.planCurrency =
                              singlePlan.sysCurrency;
                          GetAnotherWeizlePremium.premiumPlanId = singlePlan.id;
                          return value.premiumid == singlePlan.id
                              ? IconOf(
                                  Icons.check_circle_outline_rounded,
                                  singlePlan.id == '1'
                                      ? orange
                                      : singlePlan.id == '2'
                                          ? blue
                                          : singlePlan.id == '3'
                                              ? deepGreen1
                                              : black,
                                  20)
                              : const CircleAvatar(
                                  radius: 8,
                                  backgroundColor: Colors.grey,
                                );
                        }

                        planWrapper() {
                          return value.premiumid == singlePlan.id
                              ? Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: singlePlan.id == '1'
                                              ? orange
                                              : singlePlan.id == '2'
                                                  ? blue
                                                  : singlePlan.id == '3'
                                                      ? deepGreen1
                                                      : black,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: SideSpace(
                                    0,
                                    0,
                                    Material(
                                      borderRadius: BorderRadius.circular(90),
                                      elevation: 4.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: white,
                                            borderRadius:
                                                BorderRadius.circular(13)),
                                        child: SideSpace(
                                          10,
                                          15,
                                          Row(
                                            children: [
                                              leading(),
                                              const XMargin(20),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TextOf(
                                                      singlePlan.planFreq ??
                                                          "NULL",
                                                      20,
                                                      FontWeight.w500,
                                                      black),
                                                  TextOf('valid for $days days',
                                                      13, FontWeight.w400, ash),
                                                ],
                                              ),
                                              const Expanded(child: XMargin(5)),
                                              TextOf(
                                                  "N${singlePlan.planAmount ?? '0.00'}",
                                                  20,
                                                  FontWeight.w500,
                                                  singlePlan.id == '1'
                                                      ? orange
                                                      : singlePlan.id == '2'
                                                          ? blue
                                                          : singlePlan.id == '3'
                                                              ? deepGreen1
                                                              : black)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Material(
                                  elevation: 4.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: white,
                                        borderRadius:
                                            BorderRadius.circular(13)),
                                    child: SideSpace(
                                      10,
                                      15,
                                      Row(
                                        children: [
                                          leading(),
                                          const XMargin(20),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextOf(
                                                  singlePlan.planFreq ?? "NULL",
                                                  20,
                                                  FontWeight.w500,
                                                  black),
                                              TextOf('valid for $days days', 13,
                                                  FontWeight.w400, ash),
                                            ],
                                          ),
                                          const Expanded(child: XMargin(5)),
                                          TextOf(
                                              "N${singlePlan.planAmount ?? '0.00'}",
                                              20,
                                              FontWeight.w500,
                                              singlePlan.id == '1'
                                                  ? orange
                                                  : singlePlan.id == '2'
                                                      ? blue
                                                      : singlePlan.id == '3'
                                                          ? deepGreen1
                                                          : black)
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                        }

                        return Column(
                          children: [
                            const YMargin(10),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  value.setpremiumid =
                                      singlePlan.id!.toString();
                                });
                              },
                              child: planWrapper(),
                            ),
                            const YMargin(40),
                          ],
                        );
                      }),
                  const YMargin(40),
                  planiddd == value.premiumid
                      ? Container(
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SideSpace(
                                10,
                                10,
                                TextOf('Continue', 15, FontWeight.w400, white),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: ash,
                              borderRadius: BorderRadius.circular(10)),
                        )
                      : Consumer<CreateSubscriptionServiceProvider>(
                          builder: ((context, value, child) {
                          return InkWell(
                            onTap: () {
                              value.subscribe(context);
                            },
                            child: Container(
                              width: 200,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SideSpace(
                                    10,
                                    10,
                                    TextOf(
                                        'Continue', 15, FontWeight.w400, white),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: colorPrimary,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          );
                        }))
                ],
              ))
          : GettingLoading('Loading premium plans...');
    })));
  }
}

class PremiumPlansProvider extends BaseProvider {
  List<GetPremiumPlanModel> premiumPlanList = [];
  String _premiumid = '0';
  String get premiumid => _premiumid;
  set setpremiumid(String premiumid) {
    _premiumid = premiumid;
  }

  void getPlans() async {
    try {
      setLoading = true;
      const CircularProgressIndicator();
      var getPremiumPlasResponse = await emergencyApiBasics.getPremiumPlan();
      List listFromCatResponse = List.from(getPremiumPlasResponse.data['data']);
      print(listFromCatResponse);
      premiumPlanList = listFromCatResponse
          .map((json) => GetPremiumPlanModel.fromJson(json))
          .toList();

      setLoading = false;
    } catch (e) {
      print("FAILED TO FETCHH PREMIUM PLANS..... $e");
    }
  }

  PremiumPlansProvider() {
    getPlans();
  }
}

class GetPremiumPlanModel {
  String? id;
  String? planFreq;
  String? sysCurrency;
  String? planAmount;
  GetPremiumPlanModel(
      {this.id, this.planAmount, this.planFreq, this.sysCurrency});
  GetPremiumPlanModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 'Id',
        planFreq = json['planFreq'] ?? 'Plan frequency',
        sysCurrency = json['sysCurrency'] ?? 'System currency',
        planAmount = json['planAmount'] ?? 'Plan amount';
}

// class Leading extends BaseProvider {
//   String _id = '1';
//   String get id => _id;
//   bool isId = true;
//   set setId(String id) {
//     _id = id;
//   }

//   void idget() {
//     _id == '1' ? isId : !isId;
//   }

//   Leading() {
//     idget();
//   }
// }
