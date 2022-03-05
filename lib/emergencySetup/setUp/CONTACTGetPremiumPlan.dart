import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weisle/customer/resetPassword.dart';
import 'package:weisle/emergencySetup/createSubscription.dart';
import 'package:weisle/emergencySetup/setUp/setUpProvider.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:google_fonts/google_fonts.dart';

class GetWeizlePremiumContactAndCountyrPage extends StatefulWidget {
  const GetWeizlePremiumContactAndCountyrPage({Key? key}) : super(key: key);

  @override
  _GetWeizlePremiumContactAndCountyrPageState createState() =>
      _GetWeizlePremiumContactAndCountyrPageState();
}

class _GetWeizlePremiumContactAndCountyrPageState
    extends State<GetWeizlePremiumContactAndCountyrPage> {
  String? selectedCountryCode;

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
                    TextOf('Get weizle premium', 23, FontWeight.w500, black),
                    const YMargin(40),
                    Container(
                      width: 300,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 10,
                        child: Container(
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(13)),
                          child: Consumer<CreateSubscriptionServiceProvider>(
                              builder: ((context, value, child) {
                            const naija = '234';
                            return SideSpace(
                              5,
                              5,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CountryCodePicker(
                                    padding: EdgeInsets.all(0),
                                    showFlag: true,
                                    showCountryOnly: true,
                                    initialSelection: '+234',
                                    favorite: ['+234', 'NG'],
                                    showDropDownButton: false,
                                    textStyle: GoogleFonts.poppins(
                                        color: ash,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                    showOnlyCountryWhenClosed: true,
                                    onChanged: (CountryCode e) {
                                      print(e.name.toString());
                                      selectedCountryCode = e.dialCode;
                                      value.setcountryName = e.name.toString();
                                    },
                                  ),
                                  IconOf(Icons.arrow_drop_down_rounded,
                                      colorPrimary, 30)
                                ],
                              ),
                            );
                          })),
                        ),
                      ),
                    ),
                    const YMargin(10),
                    Container(
                      width: 300,
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 10,
                          child: Consumer<CreateSubscriptionServiceProvider>(
                            builder: ((context, value, child) {
                              return TextFormField(
                                keyboardType: TextInputType.phone,
                                onChanged: (e) {
                                  value.setphoneNumber =
                                      selectedCountryCode! + e;
                                },
                                decoration: InputDecoration(
                                    hintText: 'Phone number',
                                    prefixIcon: IconOf(
                                        Icons.phone_outlined, colorPrimary, 20),
                                    hintStyle: GoogleFonts.poppins(
                                      color: ash,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    fillColor: white,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(90))),
                              );
                            }),
                          )),
                    ),
                    const YMargin(40),
                    Consumer<CreateSubscriptionServiceProvider>(
                        builder: ((context, value, child) {
                      return InkWell(
                        onTap: () {
                          value.countryNamePhoneNumberCheck(context);
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
                      );
                    })),
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
                  ],
                ),
              ))),
    );
  }
}
