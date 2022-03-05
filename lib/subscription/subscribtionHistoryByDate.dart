// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:weisle/helpers/Alerts.dart';
import 'package:weisle/subscription/getSubHistory.dart';
import 'package:weisle/ui/screens/dashboard/landing_screen.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:weisle/ui/widgets/custom_fields.dart';
import 'package:weisle/ui/widgets/form_button.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/navigtion.dart';
import 'package:weisle/utils/base_provider.dart';
import 'package:weisle/utils/index.dart';
import 'package:weisle/utils/user_details_getter.dart';
import '../ui/constants/colors.dart';

class SubHistoryByDate extends StatefulWidget {
  SubHistoryByDate({
    Key? key,
  }) : super(key: key);

  @override
  _SubHistoryByDateState createState() => _SubHistoryByDateState();
}

class _SubHistoryByDateState extends State<SubHistoryByDate> {
  DateTime? selectedDate;
  DateTime? secondDselectedDate;
  String getNewDate() {
    if (selectedDate == null) {
      return 'yyyy-mm-dd';
    } else {
      return '${selectedDate!.year}-0${selectedDate!.month}-0${selectedDate!.day}';
    }
  }

  String secondGetNewDate() {
    if (secondDselectedDate == null) {
      return 'yyyy-mm-dd';
    } else {
      return '${secondDselectedDate!.year}-0${secondDselectedDate!.month}-0${secondDselectedDate!.day}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Consumer<SubHistoryByDateProvider>(
            builder: (context, value, child) {
          value.setstartDate = getNewDate();
          value.setendDate = secondGetNewDate();
          return SideSpace(
            10,
            10,
            Column(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const YMargin(20),
                  TextOf('Sub history by date', 23, FontWeight.w700, black),
                  const YMargin(25),
                  TextOfDecoration(
                      'Get your subscription histories based on the date you subscribed',
                      20,
                      FontWeight.w500,
                      ash,
                      TextAlign.left),
                  const YMargin(45),
                ]),
                Expanded(
                  child: Column(children: [
                    const YMargin(10),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            dateSelector(context);
                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            elevation: 6.0,
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  Container(
                                    height: 100,
                                    child: Center(
                                      child: SideSpace(
                                          10,
                                          10,
                                          TextOf('From', 15, FontWeight.w500,
                                              white)),
                                    ),
                                    decoration: BoxDecoration(
                                        color: colorPrimary,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  const XMargin(10),
                                  TextOfDecoration(getNewDate(), 20,
                                      FontWeight.w400, ash, TextAlign.left),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const YMargin(10),
                        InkWell(
                          onTap: () {
                            secondDateSelector(context);
                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            elevation: 6.0,
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  Container(
                                    height: 100,
                                    child: Center(
                                      child: SideSpace(
                                          10,
                                          10,
                                          TextOf('To      ', 15,
                                              FontWeight.w500, white)),
                                    ),
                                    decoration: BoxDecoration(
                                        color: colorPrimary,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  const XMargin(10),
                                  TextOfDecoration(secondGetNewDate(), 20,
                                      FontWeight.w400, ash, TextAlign.left),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const YMargin(40),
                    FormButton(
                        enabled: true,
                        text: "Get histories",
                        function: () {
                          value.subHistory(context);
                        }),
                    const YMargin(10),
                    // SubHistoryByDate()
                  ]),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Future dateSelector(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) {
      Future.delayed(Duration(seconds: 1));
      Alerts.errorAlert(context, 'Both dates are required', goBack(context));
    }
    ;
    setState(() {
      selectedDate = newDate;
    });
  }

  Future secondDateSelector(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) {
      Future.delayed(Duration(seconds: 1));
      Alerts.errorAlert(context, 'Both dates are required', goBack(context));
    }
    ;
    setState(() {
      secondDselectedDate = newDate;
    });
  }
}

//------------------------------------------------------------RESET PASWORD PROVIDER
class SubHistoryByDateProvider extends BaseProvider {
  String? _startDate;
  String? _endDate;
  String? _accountId;
  bool formValidity = false;
  List<SubHistoryByDateModel> subHistoryByDate = [];

  String get startDate => _startDate ?? '';
  String get endDate => _endDate ?? '';
  String get accountId => _accountId ?? '';

  set setstartDate(String startDate) {
    _startDate = startDate;
    checkFormValidity();
    notifyListeners();
  }

  set setendDate(String endDate) {
    _endDate = endDate;
    checkFormValidity();
    notifyListeners();
  }

  set setaccountId(String accountId) {
    _accountId = accountId;
    checkFormValidity();
    notifyListeners();
  }

  void checkFormValidity() {
    if ((_startDate != null) && (_endDate != null) && (_accountId != null)) {
      formValidity = true;
    } else {
      formValidity = false;
    }
    notifyListeners();
  }

  void subHistory(BuildContext context) async {
    var box = await Hive.openBox(weisleUserBox);
    String accountId = box.get(weisleUserName) ?? box.get(rweisleUserName);
    setaccountId = accountId;
    //setaccountId = UserDetailsGetter.userName;

    try {
      if (startDate == 'yyyy-mm-dd' || endDate == 'yyyy-mm-dd') {
        Alerts.errorAlert(context, 'Date fields are required', () {
          Navigator.pop(context);
        });
      } else {
        Alerts.loadingAlert(context, 'Sub history proc...');
        FocusScope.of(context).unfocus();
        setLoading = true;
        var registerResponse = await subscribtionApiBasic.subHistoryByDate(
            accountId: _accountId, startDate: _startDate, endDate: _endDate);
        if (registerResponse['resposeCode'] == '00') {
          setLoading = false;
          print('Request Successful');
          print('Request Successful');
          print('Request Successful');

          goBack(context);
          navigate(context,
              HistoryByDatePage(startDate: startDate, endDate: endDate));
          var dataFromResponse = registerResponse['data'];
          List listGotten = List.from(dataFromResponse).toList();
          subHistoryByDate = listGotten
              .map((json) => SubHistoryByDateModel.fromJson(json))
              .toList();
          var box = await Hive.openBox(weisleUserBox);
          box.put(weisleid, registerResponse['data']['id']);
          box.put(weisletxtRef, registerResponse['data']['txtRef']);
          box.put(weisleplanAmt, registerResponse['data']['planAmt']);
          box.put(weisleplanCurrency, registerResponse['data']['planCurrency']);
          box.put(weisleemergencyCountry,
              registerResponse['data']['emergencyCountry']);
          box.put(weislesubStatus, registerResponse['data']['subStatus']);
          box.put(weislecreatedDate, registerResponse['data']['createdDate']);
        } else if ((registerResponse['data'] == '04')) {
          Alerts.errorAlert(context, 'No data found', () {
            Navigator.pop(context);
          });
        } else {
          setLoading = false;
          goBack(context);
          Alerts.errorAlert(context, registerResponse['message'], () {
            Navigator.pop(context);
          });
        }
      }
    } catch (e) {
      setLoading = false;
      // goBack(context);
      // Alerts.errorAlert(context, 'Something went wrong', () {
      //   Navigator.pop(context);
      // }

      // );
    }
  }

  SubHistoryByDateProvider() {
    checkFormValidity();
  }
}

class SubHistoryByDateModel {
  String? id;
  String? txtRef;
  String? planAmt;
  String? planCurrency;
  String? emergencyCountry;
  String? subStatus;
  String? createdDate;

  SubHistoryByDateModel(
      {this.id,
      this.createdDate,
      this.emergencyCountry,
      this.planAmt,
      this.planCurrency,
      this.subStatus,
      this.txtRef});

  SubHistoryByDateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    txtRef = json['txtRef'] ?? '';
    planAmt = json['planAmt'] ?? '';
    planCurrency = json['planCurrency'] ?? '';
    emergencyCountry = json['emergencyCountry'] ?? "";
    subStatus = json['subStatus'] ?? '';
    createdDate = json['createdDate'] ?? '';
  }
}

class HistoryByDatePage extends StatelessWidget {
  String startDate;
  String endDate;
  HistoryByDatePage({Key? key, required this.startDate, required this.endDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: TextOf('Sub dates', 20, FontWeight.w600, white),
        foregroundColor: colorPrimary,
        leading: IconOf(Icons.arrow_back_ios_new_rounded, colorPrimary, 20),
        shadowColor: colorPrimary,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.grey.shade300,
              child: SideSpace(
                10,
                0,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        TextOf('From:', 15, FontWeight.w500, black),
                        const XMargin(10),
                        TextOf(startDate, 15, FontWeight.w300, black),
                      ],
                    ),
                    Row(
                      children: [
                        TextOf('To:', 15, FontWeight.w500, black),
                        const XMargin(10),
                        TextOf(endDate, 15, FontWeight.w300, black),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Consumer<SubHistoryByDateProvider>(
                  builder: ((context, value, child) {
                return !value.loading
                    ? ListView.builder(
                        itemCount: value.subHistoryByDate.length,
                        itemBuilder: (context, indexPosition) {
                          SubHistoryByDateModel histotiesByData =
                              value.subHistoryByDate[indexPosition];
                          return SideSpace(
                              10,
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
                                          histotiesByData.subStatus == 'Pending'
                                              ? CircleAvatar(
                                                  radius: 25,
                                                  child: IconOf(
                                                      Icons
                                                          .arrow_downward_rounded,
                                                      white,
                                                      30),
                                                  backgroundColor: Colors.red,
                                                )
                                              : histotiesByData.subStatus ==
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
                                                TextOf(histotiesByData.txtRef!,
                                                    21, FontWeight.w500, black),
                                                Row(
                                                  children: [
                                                    TextOf(
                                                        histotiesByData
                                                            .emergencyCountry!,
                                                        17,
                                                        FontWeight.w300,
                                                        ash),
                                                    TextOf(
                                                        '(${histotiesByData.planCurrency!})',
                                                        17,
                                                        FontWeight.w300,
                                                        ash),
                                                  ],
                                                ),
                                                TextOf(
                                                    histotiesByData
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
                                                  'N${histotiesByData.planAmt}',
                                                  20,
                                                  FontWeight.w500,
                                                  histotiesByData.subStatus ==
                                                          'Pending'
                                                      ? Colors.red
                                                      : histotiesByData
                                                                  .subStatus ==
                                                              'Approved'
                                                          ? Colors.green
                                                          : black),
                                              TextOf('${histotiesByData.id}',
                                                  17, FontWeight.w300, black),
                                            ],
                                          )
                                        ],
                                      ),
                                      const YMargin(10),
                                      histotiesByData.subStatus == 'Pending'
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                TextOf(
                                                    '${histotiesByData.subStatus!} approval',
                                                    17,
                                                    FontWeight.w300,
                                                    Colors.red),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.green,
                                                      border: Border.all(
                                                          color: Colors.green),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: SideSpace(
                                                      5,
                                                      2,
                                                      TextOf(
                                                          'Approve',
                                                          17,
                                                          FontWeight.w300,
                                                          Colors.white)),
                                                )
                                              ],
                                            )
                                          : histotiesByData.subStatus ==
                                                  'Approved'
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    IconOf(
                                                        Icons
                                                            .check_circle_rounded,
                                                        Colors.green,
                                                        20),
                                                    const YMargin(3),
                                                    TextOf(
                                                        histotiesByData
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
                    : GettingLoading('Getting histories...');
              })),
            ),
          ],
        ),
      ),
    );
  }
}
