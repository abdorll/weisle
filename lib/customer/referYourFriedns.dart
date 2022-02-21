import 'package:flutter/material.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:weisle/ui/widgets/margin.dart';

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
                        child: SideSpace(
                          10,
                          15,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextOfDecoration('KUgh~@Mide*34fk9', 18,
                                  FontWeight.w400, ash, TextAlign.center),
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
                        ash,
                        TextAlign.center),
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
