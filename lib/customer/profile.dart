// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weisle/customer/resetPassword.dart';
import 'package:weisle/customer/sign_in.dart';
import 'package:weisle/emergencySetup/setUp/CONTACTGetPremiumPlan.dart';
import 'package:weisle/emergencySetup/setUp/setUp.dart';
import 'package:weisle/randoms/map.dart';
import 'package:weisle/ui/constants/asset_images.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/customer/updateProfile.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/navigtion.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SideSpace(
        10,
        0,
        ListView(
          shrinkWrap: true,
          children: [
            WeisleHeader(
                Image.asset(
                  weisle_logo,
                  height: 30,
                ),
                TextOf('Profile', 20, FontWeight.w500, black),
                Image.asset(alarm)),
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    shadowColor: litePink2,
                    child: Container(
                        height: 95,
                        width: 100,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Container()),
                  ),
                  const YMargin(10),
                  Consumer<SignInProvider>(builder: ((context, value, child) {
                    return TextOf(
                        "${value.fullName}", 20, FontWeight.w400, black);
                  })),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.emoji_objects, color: colorPrimary),
                      TextOf('Badagry, Lagos State', 13, FontWeight.w400, ash),
                    ],
                  ),
                  const YMargin(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Consumer<SignInProvider>(
                          builder: ((context, value, child) {
                        return InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: TextOf('Your Weizle ID', 20,
                                        FontWeight.w500, black),
                                    content: TextOfDecoration(
                                        '${value.weisleId}',
                                        20,
                                        FontWeight.w300,
                                        black,
                                        TextAlign.left),
                                  );
                                });
                          },
                          child: MediumSizeButton(
                              () {},
                              Row(
                                children: [
                                  IconOf(
                                      Icons.person_outline_rounded, white, 30),
                                  const XMargin(10),
                                  TextOf(
                                      'Weizle ID', 20, FontWeight.w500, white)
                                ],
                              ),
                              colorSecondary,
                              10,
                              20,
                              10,
                              0),
                        );
                      })),
                      InkWell(
                        onTap: () {
                          navigate(context, const UpdateProfilePage());
                        },
                        child: MediumSizeButton(
                            () {},
                            Row(
                              children: [
                                IconOf(Icons.edit_outlined, white, 30),
                                const XMargin(10),
                                TextOf(
                                    'Edit Profile', 20, FontWeight.w500, white)
                              ],
                            ),
                            colorPrimary,
                            10,
                            20,
                            10,
                            0),
                      )
                    ],
                  ),
                  const YMargin(20),
                  SideSpace(
                      0,
                      10,
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SideSpace(
                              10,
                              10,
                              Consumer<SignInProvider>(
                                  builder: ((context, value, child) {
                                return TextOf(
                                    "Account type: ${value.accountType}",
                                    15,
                                    FontWeight.w400,
                                    ash);
                              })),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10)),
                      )),
                  SideSpace(
                    0,
                    0,
                    InkWell(
                        onTap: () {
                          navigate(context, const SetUp());
                        },
                        child: Container(
                          width: 220,
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SideSpace(
                                10,
                                1,
                                TextOf('SUBSCRIBE TO PREMIUM', 20,
                                    FontWeight.w400, black),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: colorPrimary,
                              borderRadius: BorderRadius.circular(10)),
                        )),
                  ),
                  SideSpace(
                      0,
                      10,
                      Card(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: double.infinity,
                            child: SideSpace(
                              10,
                              10,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextOf('Added usernames', 15, FontWeight.w500,
                                      black),
                                  IconOf(
                                      Icons.arrow_drop_down, colorPrimary, 20)
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      )),
                  SideSpace(
                      0,
                      10,
                      Card(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: double.infinity,
                            child: SideSpace(
                              10,
                              10,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextOf(
                                      'Sign out', 15, FontWeight.w500, black),
                                  IconOf(Icons.logout_rounded, colorPrimary, 20)
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      )),
                ])
          ],
        ),
      ),
    );
  }
}

///////-----------------------------------------------------SUBSCRIBE TO PREMIUM-----------------------------------------
///////-----------------------------------------------------SUBSCRIBE TO PREMIUM-----------------------------------------
///////-----------------------------------------------------SUBSCRIBE TO PREMIUM-----------------------------------------
///////-----------------------------------------------------SUBSCRIBE TO PREMIUM-----------------------------------------
///////-----------------------------------------------------SUBSCRIBE TO PREMIUM-----------------------------------------
///////-----------------------------------------------------SUBSCRIBE TO PREMIUM-----------------------------------------
///////-----------------------------------------------------SUBSCRIBE TO PREMIUM-----------------------------------------
///////-----------------------------------------------------SUBSCRIBE TO PREMIUM-----------------------------------------
class SubscribeToPremiumPage extends StatefulWidget {
  const SubscribeToPremiumPage({Key? key}) : super(key: key);

  @override
  _SubscribeToPremiumPageState createState() => _SubscribeToPremiumPageState();
}

class _SubscribeToPremiumPageState extends State<SubscribeToPremiumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SideSpace(
        10,
        0,
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const YMargin(20),
              WeisleAppBar(
                  'Profile', IconOf(Icons.alarm_rounded, black, 25), black),
              const SizedBox(
                height: 30,
              ),
              Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                shadowColor: litePink2,
                child: Container(
                    height: 95,
                    width: 100,
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(20)),
                    child: Container()),
              ),
              const YMargin(10),
              TextOf('Usani Usani', 20, FontWeight.w400, black),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.emoji_objects, color: colorPrimary),
                  TextOf('Sangotedo, Lagos State', 13, FontWeight.w400, ash),
                ],
              ),
              const YMargin(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MediumSizeButton(
                      () {},
                      Row(
                        children: [
                          IconOf(Icons.person_outline_rounded, white, 30),
                          TextOf('Weizle ID', 20, FontWeight.w500, white)
                        ],
                      ),
                      colorSecondary,
                      20,
                      20,
                      10,
                      0),
                  MediumSizeButton(() {
                    print('TRYING TO PRINT..................');
                  },
                      Row(
                        children: [
                          IconOf(Icons.edit_outlined, white, 30),
                          TextOf('Edit Profile', 20, FontWeight.w500, white)
                        ],
                      ),
                      colorPrimary,
                      20,
                      20,
                      10,
                      0)
                ],
              ),
              const YMargin(20),
              SideSpace(
                  0,
                  10,
                  Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Consumer<SignInProvider>(
                            builder: ((context, value, child) {
                          return SideSpace(
                            10,
                            10,
                            TextOf('Account type: ${value.accountType}', 15,
                                FontWeight.w400, ash),
                          );
                        }))
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(10)),
                  )),
              SideSpace(
                  0,
                  10,
                  Card(
                    child: Container(
                      width: double.infinity,
                      child: SideSpace(
                        10,
                        10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextOf('Added phone number', 15, FontWeight.w500,
                                black),
                            IconOf(Icons.arrow_drop_down, colorPrimary, 20)
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )),
              const YMargin(10),
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(color: colorPrimary),
                  child: Center(
                    child: TextOf(
                        'SUBSCRIBE TO PREMIUM', 20, FontWeight.w500, black),
                  ),
                ),
              ),
              SideSpace(
                  0,
                  10,
                  Card(
                    child: Container(
                      width: double.infinity,
                      child: SideSpace(
                        10,
                        10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextOf(
                                'Added usernames', 15, FontWeight.w500, black),
                            IconOf(Icons.arrow_drop_down, colorPrimary, 20)
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )),
              SideSpace(
                  0,
                  10,
                  Card(
                    child: Container(
                      width: double.infinity,
                      child: SideSpace(
                        10,
                        10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextOf('Sign out', 15, FontWeight.w500, black),
                            IconOf(Icons.logout_rounded, colorPrimary, 20)
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )),
            ]),
      ),
    );
  }
}
