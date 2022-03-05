import 'package:flutter/material.dart';
import 'package:weisle/emergencySetup/setUp/contactSetup.dart';
import 'package:weisle/ui/constants/asset_images.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/screens/dashboard/home_page.dart';
import 'package:weisle/ui/screens/dashboard/landing_screen.dart';
import 'package:weisle/ui/screens/welcome_screens/onboarding_screen.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:weisle/ui/widgets/header.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/navigtion.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
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
                    const Header(),
                    const YMargin(20),
                    TextOf('Payment method', 23, FontWeight.w500, black),
                    const YMargin(32),
                    Material(
                      elevation: 4.0,
                      borderRadius: BorderRadius.circular(13),
                      child: Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(13)),
                        child: SideSpace(
                          0,
                          15,
                          Column(
                            children: [
                              SideSpace(
                                10,
                                0,
                                Row(
                                  children: [
                                    Image.asset(
                                        "assets/images/flutter_wave.png"),
                                    const XMargin(20),
                                    TextOf(
                                        'Pay with', 18, FontWeight.w300, black),
                                    const XMargin(10),
                                    Image.asset("assets/images/flutter.png"),
                                    Image.asset("assets/images/wave.png"),
                                  ],
                                ),
                              ),
                              const YMargin(10),
                              Divider(
                                thickness: 0.4,
                                color: ash,
                              ),
                              const YMargin(10),
                              SideSpace(
                                10,
                                0,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Row(
                                        children: [
                                          IconOf(Icons.card_giftcard_outlined,
                                              ash, 15),
                                          const XMargin(4),
                                          TextOf(
                                              'Card', 15, FontWeight.w300, ash)
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Row(
                                        children: [
                                          IconOf(Icons.phone_android_rounded,
                                              ash, 15),
                                          const XMargin(4),
                                          TextOf(
                                              'USSD', 15, FontWeight.w300, ash)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const YMargin(10),
                    InkWell(
                      onTap: () {},
                      child: Material(
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
                                Image.asset(bank),
                                const XMargin(20),
                                TextOf(
                                    'Bank Transfer', 18, FontWeight.w400, ash),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const YMargin(10),
                    InkWell(
                      onTap: () {},
                      child: Material(
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
                                Image.asset(
                                  whatsapp2,
                                  color: green2,
                                ),
                                const XMargin(20),
                                TextOf('WhatsApp', 18, FontWeight.w400, ash),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const YMargin(10),
                    InkWell(
                      onTap: () {},
                      child: Material(
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
                                Image.asset(phone),
                                const XMargin(20),
                                TextOf('Call', 18, FontWeight.w400, ash),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const YMargin(60),
                    InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconOf(Icons.refresh_rounded, colorPrimary, 20),
                          TextOf('Redirect to homepage', 15, FontWeight.w500,
                              colorPrimary)
                        ],
                      ),
                      onTap: () {
                        navigatedForever(context, LandingScreen());
                      },
                    )
                  ],
                ),
              ))),
    );
  }
}
