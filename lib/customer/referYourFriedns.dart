// ignore_for_file: deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weisle/customer/sign_in.dart';
import 'package:weisle/ui/constants/asset_images.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:weisle/ui/widgets/header.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/utils/user_details_getter.dart';
import 'package:google_fonts/google_fonts.dart';

class ReferYourFriends extends StatefulWidget {
  const ReferYourFriends({Key? key}) : super(key: key);

  @override
  _ReferYourFriendsState createState() => _ReferYourFriendsState();
}

class _ReferYourFriendsState extends State<ReferYourFriends> {
  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    return Scaffold(
      body: SafeArea(
          key: key,
          child: SideSpace(
              10,
              10,
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Header(),
                    const YMargin(20),
                    TextOf('Refer your friends', 23, FontWeight.w700, black),
                    const YMargin(25),
                    TextOf(
                        'Get one month free subscription when you refer your friends',
                        20,
                        FontWeight.w500,
                        ash),
                    const YMargin(45),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      TextOfDecoration('Your Personal Code', 15,
                          FontWeight.w400, ash, TextAlign.center),
                    ]),
                    Material(
                      elevation: 4.0,
                      borderRadius: BorderRadius.circular(13),
                      child: Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(13)),
                        child: Consumer<SignInProvider>(
                            builder: ((context, value, child) {
                          return SideSpace(
                            10,
                            15,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SelectableText(
                                  value.referralCode,
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: ash),
                                ),
                                InkWell(
                                    onLongPress: () {
                                      Clipboard.setData(ClipboardData(
                                          text: value.referralCode));
                                      key.currentState!
                                          .showSnackBar(const SnackBar(
                                        content: Text("Copied to Clipboard"),
                                      ));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: colorPrimary,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border:
                                              Border.all(color: colorPrimary)),
                                      child: SideSpace(
                                          5,
                                          5,
                                          TextOf('Copy', 17, FontWeight.w500,
                                              white)),
                                    ))
                              ],
                            ),
                          );
                        })),
                      ),
                    ),
                    const YMargin(30),
                    TextOfDecoration(
                        'When your friend use your code, they will get 5% off their first subscription',
                        18,
                        FontWeight.w500,
                        ash,
                        TextAlign.center),
                    const YMargin(40),
                    ShareURL(
                        IconOf(Icons.edit_outlined, black, 40), '', 'Text'),
                    const YMargin(10),
                    ShareURL(
                        IconOf(Icons.attach_email, black, 40),
                        'mailto:yourfriend@mail.com?subject=My Weisle ID referral code',
                        'Mail'),
                    const YMargin(10),
                    ShareURL(
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: fadedBlue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SideSpace(10, 10, Image.asset(facebook)),
                        ),
                        'https://www.facebook.com',
                        'Facebook'),
                    const YMargin(10),
                    ShareURL(
                        Image.asset(
                          twitter,
                          height: 40,
                        ),
                        'https://twitter.com',
                        'Twitter'),
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

class ShareURL extends StatelessWidget {
  String url;
  Widget icon;
  String siteName;
  ShareURL(
    this.icon,
    this.url,
    this.siteName, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        urlLaunch(url);
      },
      child: Material(
        elevation: 20,
        shadowColor: white,
        shape: RoundedRectangleBorder(
            side: BorderSide(
              color: white,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: SideSpace(
          3,
          2,
          SideSpace(
            10,
            10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                icon,
                TextOf(siteName, 20, FontWeight.w500, ash),
                const XMargin(1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future urlLaunch(url) async {
  await canLaunch(url) ? launch(url) : print('UNABLE TO LAUNCH $url');
}
