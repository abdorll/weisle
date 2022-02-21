import 'package:flutter/material.dart';
import 'package:weisle/emergencySetup/setUp/anotherEmergencySetup/anotherEmerSetup.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/screens/settings/settings.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
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
                    Image.asset("assets/icons/headericons.png",
                        height: 30, width: 30),
                    const YMargin(10),
                    InkWell(
                      onTap: () {
                        navigate(context, const AnotherEmergencySetup());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [IconOf(Icons.alarm_on_rounded, black, 30)],
                      ),
                    ),
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
                                IconOf(Icons.storefront_rounded,
                                    Colors.blue.shade300, 20),
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
                                IconOf(Icons.circle, green2, 20),
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
                                IconOf(Icons.phone_rounded, deepBlue, 20),
                                const XMargin(20),
                                TextOf('Call', 18, FontWeight.w400, ash),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
