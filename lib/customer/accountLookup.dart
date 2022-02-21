// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:weisle/emergencySetup/getWeislePrmium/secGetPremiumPlan.dart';
import 'package:weisle/helpers/Alerts.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/navigtion.dart';
import 'package:weisle/utils/base_provider.dart';
import 'package:weisle/utils/index.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountLookup extends StatefulWidget {
  const AccountLookup({Key? key}) : super(key: key);

  @override
  _AccountLookupState createState() => _AccountLookupState();
}

class _AccountLookupState extends State<AccountLookup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child:
        Consumer<AccountLookupProvider>(builder: (context, value, child) {
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
                                  value.setaccountID = e;
                                },
                                decoration: InputDecoration(
                                    hintText: ' @',
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
                InkWell(
                  onTap: () {
                    value.acctLookUps(context);
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
                ),
                const YMargin(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Card(
                        child: Container(
                            height: 100,
                            width: 100,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/fire_truck.png",
                                  ),
                                  TextOf('Police', 15, FontWeight.w400, black)
                                ],
                              ),
                            )),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Card(
                        child: Container(
                            height: 100,
                            width: 100,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/fire_truck.png",
                                  ),
                                  TextOf(
                                      'Ambulance', 15, FontWeight.w400, black)
                                ],
                              ),
                            )),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Card(
                        child: Container(
                            height: 100,
                            width: 100,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/fire_truck.png",
                                  ),
                                  TextOf('Firefighters', 15, FontWeight.w400,
                                      black)
                                ],
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
                const YMargin(60),
                Container(
                  width: double.infinity,
                  height: 100,
                  child: Center(
                      child: TextOfDecoration('Banner Ads', 20, FontWeight.w500,
                          black, TextAlign.left)),
                  decoration: BoxDecoration(color: white),
                )
              ],
            ),
          ));
    })));
  }
}

class AccountLookupProvider extends BaseProvider {
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
        var accountLookupResponse =
            await customerApiBasic.acctLookup(accountId: _accountID);

        if (accountLookupResponse['resposeCode'] == '00') {
          setLoading = false;
          print('Request Successful');
          navigate(context, const GetWeizlePremium1());
        } else if (accountLookupResponse['resposeCode'] == "01") {
          setLoading = false;
          Alerts.errorAlert(context, 'Invalid account', () {
            Navigator.pop(context);
          });
        } else {
          setLoading = false;
          notifyListeners();
          Alerts.errorAlert(context, accountLookupResponse['message'], () {
            Navigator.pop(context);
          });
        }
      }
    } catch (e) {
      setLoading = false;
      Alerts.errorAlert(
          context, 'Your username or weisle Id is your Account Id', () {
        Navigator.pop(context);
      });
    }
  }

  AccountLookupProvider() {
    checkFormValidity();
  }
}
