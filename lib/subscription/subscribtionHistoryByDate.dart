import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weisle/emergencySetup/setUp/setUp.dart';
import 'package:weisle/helpers/Alerts.dart';
import 'package:weisle/ui/screens/dashboard/landing_screen.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:weisle/ui/widgets/custom_fields.dart';
import 'package:weisle/ui/widgets/form_button.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/navigtion.dart';
import 'package:weisle/utils/base_provider.dart';
import 'package:weisle/utils/index.dart';
import '../ui/constants/colors.dart';

class SubHistoryByDate extends StatefulWidget {
  const SubHistoryByDate({Key? key}) : super(key: key);

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
      return '${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}';
    }
  }

  String secondGetNewDate() {
    if (secondDselectedDate == null) {
      return 'yyyy-mm-dd';
    } else {
      return '${secondDselectedDate!.year}-${secondDselectedDate!.month}-${secondDselectedDate!.day}';
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
          return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
              children: [
                SizedBox(
                    height: 163,
                    width: 129,
                    child: Image.asset("assets/images/signIn.png")),
                PlainTextField(
                    onchanged: (String e) => value.setaccountId = e,
                    leading: const Icon(Icons.person_add_alt_1,
                        color: Color(0xffFF2156)),
                    hint: "Account Id"),
                const YMargin(10),
                InkWell(
                  onTap: () {
                    dateSelector(context);
                  },
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 6.0,
                    child: Container(
                      height: 60,
                      width: double.infinity,
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
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconOf(
                                          Icons.date_range_rounded, white, 21),
                                      TextOf('S.D', 15, FontWeight.w500, white)
                                    ],
                                  )),
                            ),
                            decoration: BoxDecoration(
                                color: colorPrimary,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          const XMargin(10),
                          Expanded(
                            child: TextOfDecoration(getNewDate(), 20,
                                FontWeight.w400, ash, TextAlign.left),
                          )
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
                      width: double.infinity,
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
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconOf(
                                          Icons.date_range_rounded, white, 21),
                                      TextOf('E.D', 15, FontWeight.w500, white)
                                    ],
                                  )),
                            ),
                            decoration: BoxDecoration(
                                color: colorPrimary,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          const XMargin(10),
                          Expanded(
                            child: TextOfDecoration(secondGetNewDate(), 20,
                                FontWeight.w400, ash, TextAlign.left),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const YMargin(60),
                FormButton(
                    enabled: true,
                    text: "Complete",
                    function: () {
                      value.subHistory(context);
                    }),
                const YMargin(40),
              ]);
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

    if (newDate == null) return;
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

    if (newDate == null) return;
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
    try {
      if (_startDate == null || _endDate == null || _accountId == null) {
        Alerts.errorAlert(context, 'All fields are required', () {
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
          navigate(context, LandingScreen());
        } else if ((registerResponse['resposeCode'] == '04')) {
          Alerts.errorAlert(context, 'No data found', () {
            Navigator.pop(context);
          });
        } else {
          setLoading = false;
          notifyListeners();
          Alerts.errorAlert(context, registerResponse['message'], () {
            Navigator.pop(context);
          });
        }
      }
    } catch (e) {
      setLoading = false;
      // ignore: avoid_print
      // print("Weisle error: $e");
      Alerts.errorAlert(context, 'Something went wrong', () {
        Navigator.pop(context);
      });
    }
  }

  SubHistoryByDateProvider() {
    checkFormValidity();
  }
}
