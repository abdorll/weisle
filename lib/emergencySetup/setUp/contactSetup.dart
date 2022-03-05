import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weisle/customer/referYourFriedns.dart';
import 'package:weisle/emergencySetup/setUp/setUpProvider.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/screens/settings/settings.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/navigtion.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactSetup extends StatefulWidget {
  const ContactSetup({Key? key}) : super(key: key);

  @override
  _ContactSetupState createState() => _ContactSetupState();
}

class _ContactSetupState extends State<ContactSetup> {
  String? thirdDdialCode;
  String? secondDdialCode;
  String? firstDdialCode;

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
                                  height: 45,
                                  child: Row(
                                    children: [
                                      Container(
                                        child: CountryCodePicker(
                                          showFlag: true,
                                          favorite: ['+234'],
                                          initialSelection: '+234',
                                          showDropDownButton: false,
                                          onChanged: (CountryCode e) {
                                            firstDdialCode = e.dialCode;
                                          },
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
                                                Consumer<SetUpProvider>(builder:
                                                    ((context, value, child) {
                                                  return TextFormField(
                                                    onChanged: (e) {
                                                      value.setcontact1 =
                                                          firstDdialCode ??
                                                              "+234" + e;
                                                    },
                                                    keyboardType:
                                                        TextInputType.phone,
                                                    decoration: InputDecoration(
                                                        hintText:
                                                            'Primary phone number',
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color:
                                                                  veryLitePink),
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          10.0)),
                                                        ),
                                                        fillColor:
                                                            veryLitePink),
                                                  );
                                                })),
                                              )))
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: veryLitePink,
                                      borderRadius: BorderRadius.circular(90)),
                                ),
                                const YMargin(7),
                                Container(
                                  height: 45,
                                  child: Row(
                                    children: [
                                      Container(
                                        child: CountryCodePicker(
                                          showFlag: true,
                                          favorite: ['+234'],
                                          initialSelection: '+234',
                                          showDropDownButton: false,
                                          onChanged: (CountryCode e) {
                                            secondDdialCode = e.dialCode;
                                          },
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
                                          Consumer<SetUpProvider>(builder:
                                              ((context, value, child) {
                                            return TextFormField(
                                              onChanged: (e) {
                                                value.setcontact2 =
                                                    secondDdialCode ??
                                                        "+234" + e;
                                              },
                                              keyboardType: TextInputType.phone,
                                              decoration: InputDecoration(
                                                  hintText: 'Phone 2',
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: veryLitePink),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10.0)),
                                                  ),
                                                  fillColor: veryLitePink),
                                            );
                                          })),
                                        ),
                                      ))
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: veryLitePink,
                                      borderRadius: BorderRadius.circular(90)),
                                ),
                                const YMargin(10),
                                Container(
                                  height: 45,
                                  child: Row(
                                    children: [
                                      Container(
                                        child: CountryCodePicker(
                                          showFlag: true,
                                          initialSelection: '+234',
                                          favorite: ['+234'],
                                          showDropDownButton: false,
                                          onChanged: (CountryCode e) {
                                            thirdDdialCode = e.dialCode;
                                          },
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
                                          Consumer<SetUpProvider>(builder:
                                              ((context, value, child) {
                                            return TextFormField(
                                              onChanged: (e) {
                                                value.setcontact3 =
                                                    thirdDdialCode ??
                                                        "+234" + e;
                                              },
                                              keyboardType: TextInputType.phone,
                                              decoration: InputDecoration(
                                                  hintText: 'Phone 3',
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: veryLitePink),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10.0)),
                                                  ),
                                                  fillColor: veryLitePink),
                                            );
                                          })),
                                        ),
                                      ))
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: veryLitePink,
                                      borderRadius: BorderRadius.circular(90)),
                                ),
                                const YMargin(20),
                                Row(
                                  children: [
                                    TextOf(
                                        'Username', 14, FontWeight.w400, black),
                                    const XMargin(10),
                                    IconOf(Icons.arrow_drop_down_rounded, black,
                                        40)
                                  ],
                                ),
                                Consumer<SetUpProvider>(
                                    builder: ((context, value, child) {
                                  return Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: litePink2,
                                        border: Border.all(color: litePink),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: SideSpace(
                                      3,
                                      5,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const XMargin(30),
                                          TextOf("@ ${value.userNames}", 20,
                                              FontWeight.w500, white),
                                        ],
                                      ),
                                    ),
                                  );
                                })),
                                const YMargin(30),
                              ],
                            )),
                      ),
                    ),
                    const YMargin(20),
                    Consumer<SetUpProvider>(builder: (context, value, child) {
                      return InkWell(
                        onTap: () {
                          value.setUp(context);
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
                    }),
                  ],
                ),
              ))),
    );
  }
}
