import 'package:flutter/material.dart';
import 'package:weisle/customer/referYourFriedns.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/screens/settings/settings.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/navigtion.dart';
import 'package:google_fonts/google_fonts.dart';

class AnotherEmergencySetup extends StatefulWidget {
  const AnotherEmergencySetup({Key? key}) : super(key: key);

  @override
  _AnotherEmergencySetupState createState() => _AnotherEmergencySetupState();
}

class _AnotherEmergencySetupState extends State<AnotherEmergencySetup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SideSpace(
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
                        '',
                        InkWell(
                            onTap: () {
                              navigate(context, const ReferYourFriends());
                            },
                            child: IconOf(Icons.alarm_add_rounded, black, 30)),
                        black),
                    const YMargin(20),
                    TextOf('Emergency setup', 23, FontWeight.w500, black),
                    const YMargin(32),
                    Container(
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(13)),
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
                                  '   Add your direct contacts as well as their usernames to alert family, friends and other app users!!!')
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
                            color: white,
                            borderRadius: BorderRadius.circular(10)),
                        child: SideSpace(
                            10,
                            10,
                            Column(
                              children: [
                                Row(
                                  children: [
                                    TextOf('Choose contacts', 14,
                                        FontWeight.w400, black),
                                  ],
                                ),
                                const YMargin(7),
                                Container(
                                  height: 40,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 100,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            IconOf(
                                                Icons.flag_rounded, green2, 20),
                                            IconOf(
                                                Icons.arrow_drop_down_rounded,
                                                green2,
                                                20),
                                            TextOfDecoration(
                                                '+234',
                                                15,
                                                FontWeight.w500,
                                                black,
                                                TextAlign.center)
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            color: litePink2,
                                            borderRadius:
                                                BorderRadius.circular(90)),
                                      ),
                                      Expanded(
                                          child: Container(
                                        width: 50,
                                        child: SideSpace(
                                          10,
                                          10,
                                          TextFormField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: veryLitePink),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(
                                                              10.0)),
                                                ),
                                                fillColor: veryLitePink),
                                          ),
                                        ),
                                      ))
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: veryLitePink,
                                      borderRadius: BorderRadius.circular(90)),
                                ),
                                const YMargin(7),
                                Container(
                                  height: 40,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 100,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            IconOf(
                                                Icons.flag_rounded, green2, 20),
                                            IconOf(
                                                Icons.arrow_drop_down_rounded,
                                                green2,
                                                20),
                                            TextOfDecoration(
                                                '+234',
                                                15,
                                                FontWeight.w500,
                                                black,
                                                TextAlign.center)
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            color: litePink2,
                                            borderRadius:
                                                BorderRadius.circular(90)),
                                      ),
                                      Expanded(
                                          child: Container(
                                        width: 50,
                                        child: SideSpace(
                                          10,
                                          10,
                                          TextFormField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: veryLitePink),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(
                                                              10.0)),
                                                ),
                                                fillColor: veryLitePink),
                                          ),
                                        ),
                                      ))
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: veryLitePink,
                                      borderRadius: BorderRadius.circular(90)),
                                ),
                                const YMargin(10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: TextOf('Add more +', 15,
                                          FontWeight.w400, black),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    TextOf(
                                        'Username', 14, FontWeight.w400, black),
                                    const XMargin(10),
                                    IconOf(Icons.arrow_drop_down_rounded, black,
                                        40)
                                  ],
                                ),
                                const YMargin(10),
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(90)),
                                  child: TextFormField(
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
                                      TextOf(
                                          'Police', 15, FontWeight.w400, black)
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
                                      TextOf('Ambulance', 15, FontWeight.w400,
                                          black)
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
                                      TextOf('Firefighters', 15,
                                          FontWeight.w400, black)
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
                          child: TextOfDecoration('Banner Ads', 20,
                              FontWeight.w500, black, TextAlign.center)),
                      decoration: BoxDecoration(color: white),
                    )
                  ],
                ),
              ))),
    );
  }
}
