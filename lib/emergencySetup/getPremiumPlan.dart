// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weisle/helpers/Alerts.dart';
import 'package:weisle/utils/base_provider.dart';
import 'package:weisle/utils/index.dart';
import 'package:weisle/emergencySetup/firstPaymentMethod.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/navigtion.dart';

class GetAnotherWeizlePremium extends StatefulWidget {
  const GetAnotherWeizlePremium({Key? key}) : super(key: key);

  @override
  _GetAnotherWeizlePremiumState createState() =>
      _GetAnotherWeizlePremiumState();
}

class _GetAnotherWeizlePremiumState extends State<GetAnotherWeizlePremium> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
        child: Consumer<PremiumPlansProvider>(builder: (context, value, child) {
      return !value.loading
          ? SideSpace(
              10,
              10,
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset("assets/icons/headericons.png",
                        height: 30, width: 30),
                    const YMargin(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [IconOf(Icons.alarm_on_rounded, black, 30)],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconOf(Icons.crop_square_rounded, colorPrimary, 20),
                        TextOf('Set up payment to renew automatically', 15,
                            FontWeight.w400, ash)
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: value.premiumPlanList.length,
                          itemBuilder: (context, indexPosition) {
                            GetPremiumPlanModel singlePlan =
                                value.premiumPlanList[indexPosition];

                            return Expanded(
                              child: Column(
                                children: [
                                  const YMargin(10),
                                  Material(
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
                                            IconOf(
                                                Icons
                                                    .check_circle_outline_rounded,
                                                deepGreen1,
                                                20),
                                            const XMargin(20),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextOf(
                                                    singlePlan.planFreq ??
                                                        "NULL",
                                                    20,
                                                    FontWeight.w400,
                                                    black),
                                                TextOf('valid for _____ days',
                                                    13, FontWeight.w400, ash),
                                              ],
                                            ),
                                            const Expanded(child: XMargin(5)),
                                            TextOf(
                                                "N${singlePlan.planAmount ?? '0.00'}",
                                                20,
                                                FontWeight.w500,
                                                deepGreen1)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const YMargin(40),
                                ],
                              ),
                            );
                          }),
                    ),
                    const YMargin(40),
                    InkWell(
                      onTap: () {
                        navigate(context, const PaymentMethod());
                      },
                      child: Container(
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
                            color: colorPrimary,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                ),
              ))
          : Center(
              child: Column(
                children: [
                  const CircularProgressIndicator(),
                  TextOf(
                      'Getting premium plans...', 20, FontWeight.w300, black),
                ],
              ),
            );
    })));
  }
}

class PremiumPlansProvider extends BaseProvider {
  List<GetPremiumPlanModel> premiumPlanList = [];

  void getPlans() async {
    try {
      setLoading = true;
      const CircularProgressIndicator();
      var getPremiumPlasResponse = await emergencyApiBasics.getPremiumPlan();
      List listFromCatResponse = List.from(getPremiumPlasResponse['data']);
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
