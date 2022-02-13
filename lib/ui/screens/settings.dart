import 'package:flutter/material.dart';
import 'package:weisle/ui/constants/colors.dart'; 
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/navigtion.dart';
import 'package:weisle/ui/screens/activity_report.dart';
import 'package:google_fonts/google_fonts.dart';

//----------------------------------------------------------SETTINGS PAGE---------------------
//----------------------------------------------------------SETTINGS PAGE---------------------
//----------------------------------------------------------SETTINGS PAGE---------------------
//----------------------------------------------------------SETTINGS PAGE---------------------
//----------------------------------------------------------SETTINGS PAGE---------------------
//----------------------------------------------------------SETTINGS PAGE---------------------
//----------------------------------------------------------SETTINGS PAGE---------------------
//----------------------------------------------------------SETTINGS PAGE---------------------
//----------------------------------------------------------SETTINGS PAGE---------------------
//----------------------------------------------------------SETTINGS PAGE---------------------
//----------------------------------------------------------SETTINGS PAGE---------------------
//----------------------------------------------------------SETTINGS PAGE---------------------
//----------------------------------------------------------SETTINGS PAGE---------------------
//----------------------------------------------------------SETTINGS PAGE---------------------

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SideSpace(
          10,
          0,
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const YMargin(10),
                Image.asset("assets/icons/headericons.png",
                    height: 30, width: 30),
                const YMargin(10),
                SideSpace(
                  0,
                  0,
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    InkWell(
                        onTap: () {
                          navigate(context, const Tracker());
                        },
                        child: IconOf(Icons.alarm_add_rounded, black, 30))
                  ]),
                ),
                const YMargin(10),
                Image.asset(
                  'assets/images/individual_person.png',
                  height: 120,
                ),
                const YMargin(20),
                TextOf(
                    'Hello User, Congrats on Successfully signing up.\n Tap on any of the emergency icons to quickly set up.',
                    15,
                    FontWeight.w300,
                    black),
                const YMargin(20),
                Material(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 6.0,
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: litePink,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          child: const XMargin(22),
                          decoration: BoxDecoration(
                              color: colorPrimary,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20))),
                        ),
                        const XMargin(20),
                        TextOf('Emergency', 20, FontWeight.w400, ash),
                        Expanded(child: const XMargin(2)),
                        Container(
                          height: 100,
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const XMargin(2),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconOf(Icons.work_off_outlined, colorPrimary,
                                      20),
                                  TextOf('Medical', 20, FontWeight.w500, ash)
                                ],
                              ),
                              IconOf(Icons.arrow_drop_down_rounded,
                                  colorPrimary, 30),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    ),
                  ),
                ),
                const YMargin(20),
                Material(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 6.0,
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: litePink,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 150,
                          child: Center(
                            child: TextOf(
                                'Default\nMessage', 20, FontWeight.w500, white),
                          ),
                          decoration: BoxDecoration(
                              color: colorPrimary,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        const XMargin(20),
                        TextOf('Emergency!!!\nplease help!!!', 18,
                            FontWeight.w400, ash),
                      ],
                    ),
                  ),
                ),
                const YMargin(20),
                Material(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 6.0,
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: litePink,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 150,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const XMargin(5),
                                TextOf('Medical\nMessage', 20, FontWeight.w500,
                                    white),
                                IconOf(
                                    Icons.arrow_drop_down_rounded, white, 40),
                                const XMargin(0),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: colorPrimary,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        const XMargin(20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextOf('Medical emergency!!!', 18, FontWeight.w400,
                                ash),
                            TextOf('please help!!!', 18, FontWeight.w400, ash),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const YMargin(20),
                InkWell(
                  onTap: () {
                    navigate(context, const EmergencySetup());
                  },
                  child: MediumSizeButton(
                      () {},
                      TextOf('Continue', 29, FontWeight.w500, white),
                      colorPrimary,
                      90,
                      30,
                      10,
                      4),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  oneActivity(index, color) {
    setState(() {
      current = index;
    });
  }
}

//----------------------------------------------------------EMERGENCY SETUP---------------------
//----------------------------------------------------------EMERGENCY SETUP---------------------
//----------------------------------------------------------EMERGENCY SETUP---------------------
//----------------------------------------------------------EMERGENCY SETUP---------------------
//----------------------------------------------------------EMERGENCY SETUP---------------------
//----------------------------------------------------------EMERGENCY SETUP---------------------
//----------------------------------------------------------EMERGENCY SETUP---------------------
//----------------------------------------------------------EMERGENCY SETUP---------------------
//----------------------------------------------------------EMERGENCY SETUP---------------------
//----------------------------------------------------------EMERGENCY SETUP---------------------
//----------------------------------------------------------EMERGENCY SETUP---------------------
//----------------------------------------------------------EMERGENCY SETUP---------------------
//----------------------------------------------------------EMERGENCY SETUP---------------------
//----------------------------------------------------------EMERGENCY SETUP---------------------

class EmergencySetup extends StatefulWidget {
  const EmergencySetup({Key? key}) : super(key: key);

  @override
  _EmergencySetupState createState() => _EmergencySetupState();
}

class _EmergencySetupState extends State<EmergencySetup> {
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
                        '', IconOf(Icons.alarm_add_rounded, black, 30), black),
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
                            color: white,
                            borderRadius: BorderRadius.circular(10)),
                        child: SideSpace(
                            10,
                            10,
                            Column(
                              children: [
                                Row(
                                  children: [
                                    TextOf(
                                        'Username', 14, FontWeight.w400, ash),
                                    const XMargin(10),
                                    IconOf(Icons.arrow_drop_down_rounded, black,
                                        40)
                                  ],
                                ),
                                const YMargin(10),
                                Container(
                                  height: 40,
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
                    InkWell(
                      onTap: () {
                        navigate(context, GetWeizlePremium1());
                      },
                      child: Container(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SideSpace(
                              10,
                              10,
                              TextOf('Subscribe to premium', 15,
                                  FontWeight.w400, white),
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
                          child: TextOfDecoration(
                              'Banner Ads', 20, FontWeight.w500, black)),
                      decoration: BoxDecoration(color: white),
                    )
                  ],
                ),
              ))),
    );
  }
}

//----------------------------------------------------------GET WEIZLE PREMIUM1---------------------
//----------------------------------------------------------GET WEIZLE PREMIUM1---------------------
//----------------------------------------------------------GET WEIZLE PREMIUM1---------------------
//----------------------------------------------------------GET WEIZLE PREMIUM1---------------------
//----------------------------------------------------------GET WEIZLE PREMIUM1---------------------
//----------------------------------------------------------GET WEIZLE PREMIUM1---------------------
//----------------------------------------------------------GET WEIZLE PREMIUM1---------------------
//----------------------------------------------------------GET WEIZLE PREMIUM1---------------------
//----------------------------------------------------------GET WEIZLE PREMIUM1---------------------
//----------------------------------------------------------GET WEIZLE PREMIUM1---------------------
//----------------------------------------------------------GET WEIZLE PREMIUM1---------------------
//----------------------------------------------------------GET WEIZLE PREMIUM1---------------------
//----------------------------------------------------------GET WEIZLE PREMIUM1---------------------
//----------------------------------------------------------GET WEIZLE PREMIUM1---------------------
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
                            TextOf('Prepare for possible emergency situations',
                                15, FontWeight.w400, ash)
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
                          child: TextOfDecoration(
                              'Banner Ads', 20, FontWeight.w500, black)),
                      decoration: BoxDecoration(color: white),
                    )
                  ],
                ),
              ))),
    );
  }
}

//----------------------------------------------------------GET WEIZLE PREMIUM2---------------------
//----------------------------------------------------------GET WEIZLE PREMIUM2---------------------
//----------------------------------------------------------GET WEIZLE PREMIUM2---------------------
//----------------------------------------------------------GET WEIZLE PREMIUM2---------------------
//----------------------------------------------------------GET WEIZLE PREMIUM2---------------------
//----------------------------------------------------------GET WEIZLE PREMIUM2---------------------
//----------------------------------------------------------GET WEIZLE PREMIUM2---------------------
//----------------------------------------------------------GET WEIZLE PREMIUM2---------------------
//----------------------------------------------------------GET WEIZLE PREMIUM2---------------------
//----------------------------------------------------------GET WEIZLE PREMIUM2---------------------
//----------------------------------------------------------GET WEIZLE PREMIUM2---------------------
//----------------------------------------------------------GET WEIZLE PREMIUM2---------------------
//----------------------------------------------------------GET WEIZLE PREMIUM2---------------------
//----------------------------------------------------------GET WEIZLE PREMIUM2---------------------
class GetAnotherWeizlePremium extends StatefulWidget {
  const GetAnotherWeizlePremium({Key? key}) : super(key: key);

  @override
  _GetAnotherWeizlePremiumState createState() =>
      _GetAnotherWeizlePremiumState();
}

class _GetAnotherWeizlePremiumState extends State<GetAnotherWeizlePremium> {
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
                              IconOf(Icons.circle_outlined, ash, 20),
                              const XMargin(20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextOf('Monthly', 20, FontWeight.w400, black),
                                  TextOf('valid for 30 days', 13,
                                      FontWeight.w400, ash),
                                ],
                              ),
                              const Expanded(child: XMargin(5)),
                              TextOf('N 1,200', 20, FontWeight.w500, brown)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const YMargin(10),
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
                              IconOf(Icons.circle_outlined, ash, 20),
                              const XMargin(20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextOf(
                                      'Quaterly', 20, FontWeight.w400, black),
                                  TextOf('valid for 90 days', 13,
                                      FontWeight.w400, ash),
                                ],
                              ),
                              const Expanded(child: XMargin(5)),
                              TextOf('N 3,000', 20, FontWeight.w500, deepBlue)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const YMargin(10),
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
                              IconOf(Icons.check_circle_outline_rounded,
                                  deepGreen1, 20),
                              const XMargin(20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextOf(
                                      'Annually', 20, FontWeight.w400, black),
                                  TextOf('valid for 360 days', 13,
                                      FontWeight.w400, ash),
                                ],
                              ),
                              const Expanded(child: XMargin(5)),
                              TextOf(
                                  'N 10,000', 20, FontWeight.w500, deepGreen1)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const YMargin(40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconOf(Icons.crop_square_rounded, colorPrimary, 20),
                        TextOf('Set up payment to renew automatically', 15,
                            FontWeight.w400, ash)
                      ],
                    ),
                    const YMargin(40),
                    InkWell(
                      onTap: () {
                        navigate(context, const PaymentMethod());
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
                  ],
                ),
              ))),
    );
  }
}

//----------------------------------------------------------PAYMENT METHOD---------------------
//----------------------------------------------------------PAYMENT METHOD---------------------
//----------------------------------------------------------PAYMENT METHOD---------------------
//----------------------------------------------------------PAYMENT METHOD---------------------
//----------------------------------------------------------PAYMENT METHOD---------------------
//----------------------------------------------------------PAYMENT METHOD---------------------
//----------------------------------------------------------PAYMENT METHOD---------------------
//----------------------------------------------------------PAYMENT METHOD---------------------
//----------------------------------------------------------PAYMENT METHOD---------------------
//----------------------------------------------------------PAYMENT METHOD---------------------
//----------------------------------------------------------PAYMENT METHOD---------------------
//----------------------------------------------------------PAYMENT METHOD---------------------
//----------------------------------------------------------PAYMENT METHOD---------------------
//----------------------------------------------------------PAYMENT METHOD---------------------

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

//----------------------------------------------------------ANOTHETER EMERGENCY SETUP---------------------
//----------------------------------------------------------ANOTHETER EMERGENCY SETUP---------------------
//----------------------------------------------------------ANOTHETER EMERGENCY SETUP---------------------
//----------------------------------------------------------ANOTHETER EMERGENCY SETUP---------------------
//----------------------------------------------------------ANOTHETER EMERGENCY SETUP---------------------
//----------------------------------------------------------ANOTHETER EMERGENCY SETUP---------------------
//----------------------------------------------------------ANOTHETER EMERGENCY SETUP---------------------
//----------------------------------------------------------ANOTHETER EMERGENCY SETUP---------------------
//----------------------------------------------------------ANOTHETER EMERGENCY SETUP---------------------
//----------------------------------------------------------ANOTHETER EMERGENCY SETUP---------------------
//----------------------------------------------------------ANOTHETER EMERGENCY SETUP---------------------
//----------------------------------------------------------ANOTHETER EMERGENCY SETUP---------------------
//----------------------------------------------------------ANOTHETER EMERGENCY SETUP---------------------
//----------------------------------------------------------ANOTHETER EMERGENCY SETUP---------------------
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
                                            TextOfDecoration('+234', 15,
                                                FontWeight.w500, black)
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
                                            TextOfDecoration('+234', 15,
                                                FontWeight.w500, black)
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
                          child: TextOfDecoration(
                              'Banner Ads', 20, FontWeight.w500, black)),
                      decoration: BoxDecoration(color: white),
                    )
                  ],
                ),
              ))),
    );
  }
}

//----------------------------------------------------------REFER YOUR FRIENDS---------------------
//----------------------------------------------------------REFER YOUR FRIENDS---------------------
//----------------------------------------------------------REFER YOUR FRIENDS---------------------
//----------------------------------------------------------REFER YOUR FRIENDS---------------------
//----------------------------------------------------------REFER YOUR FRIENDS---------------------
//----------------------------------------------------------REFER YOUR FRIENDS---------------------
//----------------------------------------------------------REFER YOUR FRIENDS---------------------
//----------------------------------------------------------REFER YOUR FRIENDS---------------------
//----------------------------------------------------------REFER YOUR FRIENDS---------------------
//----------------------------------------------------------REFER YOUR FRIENDS---------------------
//----------------------------------------------------------REFER YOUR FRIENDS---------------------
//----------------------------------------------------------REFER YOUR FRIENDS---------------------
//----------------------------------------------------------REFER YOUR FRIENDS---------------------
//----------------------------------------------------------REFER YOUR FRIENDS---------------------

class ReferYourFriends extends StatefulWidget {
  const ReferYourFriends({Key? key}) : super(key: key);

  @override
  _ReferYourFriendsState createState() => _ReferYourFriendsState();
}

class _ReferYourFriendsState extends State<ReferYourFriends> {
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
                        '', IconOf(Icons.alarm_on_rounded, black, 30), black),
                    const YMargin(20),
                    TextOf('Refer your friends', 23, FontWeight.w500, black),
                    const YMargin(25),
                    TextOf(
                        'Get one month free subscription when you refer your friends',
                        20,
                        FontWeight.w400,
                        ash),
                    const YMargin(45),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      TextOfDecoration(
                          'Your Personal Code', 15, FontWeight.w400, ash),
                    ]),
                    Material(
                      elevation: 4.0,
                      borderRadius: BorderRadius.circular(13),
                      child: Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(13)),
                        child: SideSpace(
                          10,
                          15,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextOfDecoration(
                                  'KUgh~@Mide*34fk9', 18, FontWeight.w400, ash),
                              IconOf(Icons.copy_all_rounded, colorPrimary, 20)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const YMargin(30),
                    TextOfDecoration(
                        '"When your friend use your code, they will get 5% off their first subscription"',
                        18,
                        FontWeight.w400,
                        ash),
                    const YMargin(40),
                    Material(
                      elevation: 6,
                      borderRadius: BorderRadius.circular(30),
                      child: SideSpace(
                        15,
                        15,
                        Container(
                          height: 150,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextOf(
                                        'Share with', 20, FontWeight.w400, ash),
                                    const XMargin(7),
                                    IconOf(
                                        Icons.share_rounded, colorPrimary, 30)
                                  ]),
                              const YMargin(30),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Card(
                                      child: Container(
                                          height: 70,
                                          width: 70,
                                          child: Center(
                                            child: IconOf(
                                                Icons.favorite_border_rounded,
                                                black,
                                                30),
                                          )),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Card(
                                      child: Container(
                                          height: 70,
                                          width: 70,
                                          child: Center(
                                            child: IconOf(Icons.pages_rounded,
                                                deepBlue, 30),
                                          )),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Card(
                                      child: Container(
                                          height: 70,
                                          width: 70,
                                          child: Center(
                                            child: IconOf(Icons.grass_rounded,
                                                green1, 30),
                                          )),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Card(
                                      child: Container(
                                          height: 70,
                                          width: 70,
                                          child: Center(
                                            child: IconOf(
                                                Icons.family_restroom_rounded,
                                                colorPrimary,
                                                30),
                                          )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const YMargin(30),
                    Container(
                      width: 90,
                      height: 3,
                      decoration: BoxDecoration(
                          color: colorPrimary,
                          borderRadius: BorderRadius.circular(90)),
                    ),
                    const YMargin(30)
                  ],
                ),
              ))),
    );
  }
}
