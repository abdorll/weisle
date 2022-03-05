// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:weisle/emergencySetup/setUp/CONTACTGetPremiumPlan.dart';
import 'package:weisle/emergencySetup/setUp/setUpProvider.dart';
import 'package:weisle/helpers/Alerts.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/navigtion.dart';
import 'package:weisle/utils/base_provider.dart';
import 'package:weisle/utils/index.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SetUsernamePage extends StatefulWidget {
  static String? name;
  const SetUsernamePage({Key? key}) : super(key: key);

  @override
  _SetUsernamePageState createState() => _SetUsernamePageState();
}

class _SetUsernamePageState extends State<SetUsernamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
        child: Consumer<SetUpProvider>(builder: (context, value, child) {
      return SideSpace(
          10,
          10,
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/icons/headericons.png",
                    height: 30, width: 30),
                const YMargin(10),
                WeisleAppBar(
                    '', IconOf(Icons.alarm_add_rounded, black, 30), black),
                const YMargin(20),
                TextOf('Emergency setup', 23, FontWeight.w500, black),
                const YMargin(32),
                Container(
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(13)),
                  child: SideSpace(
                    10,
                    10,
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Note:  ',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: colorPrimary,
                              decoration: TextDecoration.underline)),
                      TextSpan(
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: ash,
                            fontWeight: FontWeight.w400,
                          ),
                          text:
                              '  Add as many usernames as you want to alert other app users')
                    ])),
                  ),
                ),
                const YMargin(20),
                Material(
                  borderRadius: BorderRadius.circular(90),
                  elevation: 6.0,
                  color: litePink2,
                  child: Container(
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(10)),
                    child: SideSpace(
                        10,
                        10,
                        Column(
                          children: [
                            Row(
                              children: [
                                TextOf('Username', 14, FontWeight.w400, ash),
                                const XMargin(10),
                                IconOf(Icons.arrow_drop_down_rounded, black, 40)
                              ],
                            ),
                            const YMargin(10),
                            Container(
                              height: 40,
                              child: TextFormField(
                                onChanged: (e) {
                                  value.setuserNames = e;
                                },
                                decoration: InputDecoration(
                                    hintText:
                                        'name 1, name2, name3, name4, etc..',
                                    hintStyle: GoogleFonts.poppins(
                                      color: white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    fillColor: litePink2,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(90))),
                              ),
                            ),
                            const YMargin(30),
                          ],
                        )),
                  ),
                ),
                const YMargin(20),
                Consumer<SetUpProvider>(builder: (context, value, child) {
                  return InkWell(
                    onTap: () {
                      value.userNamesCheck(context);
                    },
                    child: Container(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SideSpace(
                            10,
                            10,
                            TextOf('Subscribe to premium', 15, FontWeight.w400,
                                white),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: colorPrimary,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  );
                }),
                const YMargin(20),
              ],
            ),
          ));
    })));
  }
}

class SetUsernamePageProvider extends BaseProvider {
  String? _accountID;
  bool formValidity = false;
  String get accountID => _accountID ?? '';
  set setaccountID(String accountID) {
    _accountID = accountID;
    checkFormValidity();
    notifyListeners();
  }

  void checkFormValidity() {
    if ((_accountID != null)) {
      formValidity = true;
    } else {
      formValidity = false;
    }
    notifyListeners();
  }

  void acctLookUps(context) async {
    var box = await Hive.openBox(weisleUserBox);
    String username = box.get(weisleUserName);
    String weisleID = box.get(weisleId);

    try {
      if (_accountID == null) {
        Alerts.errorAlert(context, 'Account ID is required required', () {
          Navigator.pop(context);
        });
      } else {
        Alerts.loadingAlert(context, 'Looking up...');
        FocusScope.of(context).unfocus();
        setLoading = true;
        var SetUsernamePageResponse =
            await customerApiBasic.acctLookup(accountId: _accountID);

        if (SetUsernamePageResponse['resposeCode'] == '00') {
          setLoading = false;
          print('Request Successful');
          goBack(context);
          Alerts.successAlert(context, 'Successfully looked up your account',
              () {
            navigateReplaces(context, GetWeizlePremiumContactAndCountyrPage());
          });
        } else if (SetUsernamePageResponse['resposeCode'] == "01") {
          setLoading = false;
          Alerts.errorAlert(context, 'Invalid account', () {
            Navigator.pop(context);
          });
        } else {
          setLoading = false;
          goBack(context);
          Alerts.errorAlert(context, SetUsernamePageResponse['message'], () {
            Navigator.pop(context);
          });
          notifyListeners();
        }
      }
    } catch (e) {
      setLoading = false;
      goBack(context);
      Alerts.errorAlert(
          context, 'Your username or weisle Id is your Account Id', () {});
    }
  }

  SetUsernamePageProvider() {
    checkFormValidity();
  }
}
