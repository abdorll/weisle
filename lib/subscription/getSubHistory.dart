// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:weisle/subscription/subscribtionHistoryByDate.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:weisle/ui/widgets/form_button.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/utils/base_provider.dart';
import 'package:weisle/utils/index.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GetSubscribtionHistoryPage extends StatefulWidget {
  const GetSubscribtionHistoryPage({Key? key}) : super(key: key);

  @override
  _GetSubscribtionHistoryPageState createState() =>
      _GetSubscribtionHistoryPageState();
}

class _GetSubscribtionHistoryPageState
    extends State<GetSubscribtionHistoryPage> {
  GetSubHistoryProvider getSubHistoryProvider = GetSubHistoryProvider();

  @override
  void initState() {
    getSubHistoryProvider.getSubHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: white,
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                TextOf('Subscriptions', 20, FontWeight.w400, white),
                TextOf('Subs by date', 20, FontWeight.w400, white),
              ],
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: white,
              indicatorWeight: 4,
              labelColor: colorPrimary,
              padding: const EdgeInsets.only(bottom: 5),
            ),
            iconTheme: IconThemeData(color: white),
            backgroundColor: colorPrimary,
            title: TextOf('Subscription history', 20, FontWeight.w500, white),
          ),
          body: TabBarView(children: [AllSubHistpries(), SubHistoryByDate()])),
    );
  }
}

class GetSubHistoryProvider extends BaseProvider {
  List<GetSubHistoryModel> subHistories = [];
  GetSubHistoryProvider() {
    getSubHistory();
  }

  void getSubHistory() async {
    try {
      setLoading = true;

      var getSubHistoryResponse = await subscribtionApiBasic.getSubHistory();
      var listFromResponse = List.from(getSubHistoryResponse['data']);
      print(listFromResponse);
      subHistories = listFromResponse
          .map((json) => GetSubHistoryModel.fromJson(json))
          .toList();
      setLoading = false;
    } catch (e) {
      print('FAILE TO FETCH SUB HISTORY $e');
    }
  }
}

class GetSubHistoryModel {
  String? id;
  String? txtRef;
  String? planAmt;
  String? planCurrency;
  String? emergencyCountry;
  String? subStatus;
  String? createdDate;

  GetSubHistoryModel(
      {this.createdDate,
      this.id,
      this.emergencyCountry,
      this.planAmt,
      this.planCurrency,
      this.subStatus,
      this.txtRef});

  GetSubHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 'Id';
    txtRef = json['txtRef'] ?? 'Text ref';
    planAmt = json['planAmt'] ?? 'Plan amount';
    planCurrency = json['planCurrency'] ?? 'Plan currency';
    emergencyCountry = json['emergencyCountry'] ?? 'Emergency country';
    subStatus = json['subStatus'] ?? 'Subscription status';
    createdDate = json['createdDate'] ?? 'Date created';
  }
}

class AllSubHistpries extends StatelessWidget {
  const AllSubHistpries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Consumer<GetSubHistoryProvider>(
                builder: (context, value, child) {
              return !value.loading
                  ? ListView.builder(
                      itemCount: value.subHistories.length,
                      itemBuilder: (context, indexPosition) {
                        GetSubHistoryModel listOfhistories =
                            value.subHistories[indexPosition];
                        return SideSpace(
                          10,
                          10,
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: colorPrimary, width: 2)),
                            child: Card(
                              elevation: 10,
                              color: litePink,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SideSpace(
                                      10,
                                      0,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextOf('Plan Id:', 20,
                                              FontWeight.w500, black),
                                          TextOfDecoration(
                                              listOfhistories.id!,
                                              20,
                                              FontWeight.w300,
                                              black,
                                              TextAlign.left),
                                        ],
                                      )),
                                  SideSpace(
                                    10,
                                    0,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextOf('Text ref:', 20, FontWeight.w500,
                                            black),
                                        TextOf(listOfhistories.txtRef!, 20,
                                            FontWeight.w300, black),
                                      ],
                                    ),
                                  ),
                                  SideSpace(
                                    10,
                                    0,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextOf('Plan Amount:', 20,
                                            FontWeight.w500, black),
                                        TextOf(listOfhistories.planAmt!, 20,
                                            FontWeight.w300, black),
                                      ],
                                    ),
                                  ),
                                  SideSpace(
                                      10,
                                      0,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextOf('Plan currency:', 20,
                                              FontWeight.w500, black),
                                          TextOf(listOfhistories.planCurrency!,
                                              20, FontWeight.w300, black),
                                        ],
                                      )),
                                  SideSpace(
                                    10,
                                    0,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextOf('Country:', 20, FontWeight.w500,
                                            black),
                                        TextOf(
                                            listOfhistories.emergencyCountry!,
                                            20,
                                            FontWeight.w300,
                                            black),
                                      ],
                                    ),
                                  ),
                                  const YMargin(5),
                                  FormButton(
                                      enabled: true,
                                      text: "Confirm",
                                      function: () {
                                        //value.register(context);
                                      }),
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                  : GettingLoading('Getting subscriptions...');
            }),
          ),
        ],
      ),
    );
  }
}

class GettingLoading extends StatelessWidget {
  String message;
  GettingLoading(
    this.message, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const CircularProgressIndicator(
          strokeWidth: 3,
        ),
        const XMargin(10),
        TextOf(message, 15, FontWeight.w500, black)
      ]),
    );
  }
}
