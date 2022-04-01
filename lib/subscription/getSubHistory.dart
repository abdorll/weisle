// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:weisle/emergencySetup/confirmSubscription.dart';
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
          body: TabBarView(
              children: [const AllSubHistpries(), SubHistoryByDate()])),
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
      var listFromResponse = List.from(getSubHistoryResponse.data!['data']);
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
  static var textRef;
  const AllSubHistpries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
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
                        return value.subHistories.length < 1 ||
                                value.subHistories.length == null
                            ? Container()
                            : SideSpace(
                                5,
                                10,
                                Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: SideSpace(
                                    10,
                                    5,
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            listOfhistories.subStatus ==
                                                    'Pending'
                                                ? CircleAvatar(
                                                    radius: 25,
                                                    child: IconOf(
                                                        Icons
                                                            .arrow_downward_rounded,
                                                        white,
                                                        30),
                                                    backgroundColor: Colors.red,
                                                  )
                                                : listOfhistories.subStatus ==
                                                        'Approved'
                                                    ? CircleAvatar(
                                                        radius: 25,
                                                        child: IconOf(
                                                            Icons
                                                                .arrow_upward_rounded,
                                                            white,
                                                            30),
                                                        backgroundColor:
                                                            Colors.green,
                                                      )
                                                    : CircleAvatar(
                                                        radius: 25,
                                                        child: IconOf(
                                                            Icons
                                                                .circle_notifications_rounded,
                                                            white,
                                                            30),
                                                        backgroundColor: blue,
                                                      ),
                                            const XMargin(10),
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TextOf(
                                                      listOfhistories.txtRef!,
                                                      21,
                                                      FontWeight.w500,
                                                      black),
                                                  Row(
                                                    children: [
                                                      TextOf(
                                                          listOfhistories
                                                              .emergencyCountry!,
                                                          17,
                                                          FontWeight.w300,
                                                          ash),
                                                      TextOf(
                                                          '(${listOfhistories.planCurrency!})',
                                                          17,
                                                          FontWeight.w300,
                                                          ash),
                                                    ],
                                                  ),
                                                  TextOf(
                                                      listOfhistories
                                                          .createdDate!,
                                                      15,
                                                      FontWeight.w300,
                                                      ash),
                                                ]),
                                            const Expanded(child: XMargin(10)),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextOf(
                                                    'N${listOfhistories.planAmt}',
                                                    20,
                                                    FontWeight.w500,
                                                    listOfhistories.subStatus ==
                                                            'Pending'
                                                        ? Colors.red
                                                        : listOfhistories
                                                                    .subStatus ==
                                                                'Approved'
                                                            ? Colors.green
                                                            : black),
                                                TextOf('${listOfhistories.id}',
                                                    17, FontWeight.w300, black),
                                              ],
                                            )
                                          ],
                                        ),
                                        const YMargin(10),
                                        listOfhistories.subStatus == 'Pending'
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  TextOf(
                                                      '${listOfhistories.subStatus!} approval',
                                                      17,
                                                      FontWeight.w300,
                                                      Colors.red),
                                                  Consumer<
                                                          ConfirmSubscriptionServiceProvider>(
                                                      builder: ((context, value,
                                                          child) {
                                                    return InkWell(
                                                      onTap: () {
                                                        AllSubHistpries
                                                                .textRef =
                                                            listOfhistories
                                                                .txtRef;
                                                        value.settxtRef =
                                                            AllSubHistpries
                                                                .textRef;
                                                        value.setsubId =
                                                            listOfhistories.id!;
                                                        value
                                                            .confirmSubscription(
                                                                context);
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.green,
                                                            border: Border.all(
                                                                color: Colors
                                                                    .green),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        child: SideSpace(
                                                            5,
                                                            2,
                                                            TextOf(
                                                                'Approve',
                                                                17,
                                                                FontWeight.w300,
                                                                Colors.white)),
                                                      ),
                                                    );
                                                  }))
                                                ],
                                              )
                                            : listOfhistories.subStatus ==
                                                    'Approved'
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      IconOf(
                                                          Icons
                                                              .check_circle_rounded,
                                                          Colors.green,
                                                          20),
                                                      const YMargin(3),
                                                      TextOf(
                                                          listOfhistories
                                                              .subStatus!,
                                                          17,
                                                          FontWeight.w300,
                                                          Colors.green)
                                                    ],
                                                  )
                                                : Row()
                                      ],
                                    ),
                                  ),
                                ));
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
