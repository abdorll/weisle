import 'package:flutter/material.dart';
import 'package:weisle/emergencySetup/getPremiumPlan.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/navigtion.dart';
import 'package:google_fonts/google_fonts.dart';

class GetWeizlePremium1 extends StatefulWidget {
  const GetWeizlePremium1({Key? key}) : super(key: key);

  @override
  _GetWeizlePremium1State createState() => _GetWeizlePremium1State();
}

class _GetWeizlePremium1State extends State<GetWeizlePremium1> {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [IconOf(Icons.alarm_on_rounded, black, 30)],
                    ),
                    const YMargin(20),
                    TextOf('Get weizle premium', 23, FontWeight.w500, black),
                    const YMargin(32),
                    Material(
                      elevation: 4.0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(13)),
                        child: SideSpace(
                          10,
                          15,
                          Row(
                            children: [
                              IconOf(Icons.flag_rounded, green1, 20),
                              const XMargin(20),
                              TextOf('Nigeria', 18, FontWeight.w400, ash),
                              const Expanded(child: XMargin(5)),
                              IconOf(Icons.arrow_drop_down_rounded,
                                  colorPrimary, 20)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const YMargin(10),
                    Material(
                      elevation: 4.0,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Mobile',
                            prefixIcon:
                                IconOf(Icons.phone_outlined, colorPrimary, 20),
                            hintStyle: GoogleFonts.poppins(
                              color: ash,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                            fillColor: white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(90))),
                      ),
                    ),
                    const YMargin(40),
                    InkWell(
                      onTap: () {
                        navigate(context, const GetAnotherWeizlePremium());
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
                    const YMargin(20),
                    Column(
                      children: [
                        Row(
                          children: [
                            IconOf(
                                Icons.check_circle_rounded, colorPrimary, 18),
                            const XMargin(10),
                            TextOf('Enjoy unlimited access to weizle app', 15,
                                FontWeight.w400, ash)
                          ],
                        ),
                        const YMargin(30),
                        Row(
                          children: [
                            IconOf(
                                Icons.check_circle_rounded, colorPrimary, 18),
                            const XMargin(10),
                            TextOf('Ask questions and get help from experts',
                                15, FontWeight.w400, ash)
                          ],
                        ),
                        const YMargin(30),
                        Row(
                          children: [
                            IconOf(
                                Icons.check_circle_rounded, colorPrimary, 18),
                            const XMargin(10),
                            TextOfDecoration(
                                'Prepare for possible emergency situations',
                                15,
                                FontWeight.w400,
                                ash,
                                TextAlign.center)
                          ],
                        ),
                        const YMargin(30),
                        Row(
                          children: [
                            IconOf(
                                Icons.check_circle_rounded, colorPrimary, 18),
                            const XMargin(10),
                            TextOf('Earn more chances to win promotions', 15,
                                FontWeight.w400, ash)
                          ],
                        ),
                        const YMargin(30),
                      ],
                    ),
                    const YMargin(30),
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
