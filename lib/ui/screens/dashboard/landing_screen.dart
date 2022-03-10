// ignore_for_file: prefer_const_constructors_in_immutables, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:weisle/customer/profile.dart';
import 'package:weisle/ui/constants/asset_images.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/screens/activity_report.dart';
import 'package:weisle/ui/screens/dashboard/settings.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'home_page.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int currentTab = 0;
  final List<Widget> screens = [
    const Homepage(),
    const Report(),
    const ProfileScreen(),
    const Settings(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Homepage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Image.asset(weisle_logo),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          color: Colors.grey[50],
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: ash,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                  border: Border.all(
                    color: white,
                  )),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = Homepage();
                            currentTab = 0;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ImageIcon(
                              const AssetImage(home_icon),
                              color:
                                  currentTab == 0 ? colorPrimary : Colors.grey,
                            ),
                            CircleAvatar(
                              radius: 2,
                              backgroundColor:
                                  currentTab == 0 ? colorPrimary : white,
                            ),
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = Report();
                            currentTab = 1;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconOf(
                                Icons.search_outlined,
                                currentTab == 1 ? colorPrimary : Colors.grey,
                                25),
                            CircleAvatar(
                              radius: 2,
                              backgroundColor:
                                  currentTab == 1 ? colorPrimary : white,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = ProfileScreen();
                            currentTab = 2;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ImageIcon(
                              const AssetImage(broadcast_icon),
                              color:
                                  currentTab == 2 ? colorPrimary : Colors.grey,
                            ),
                            CircleAvatar(
                              radius: 2,
                              backgroundColor:
                                  currentTab == 2 ? colorPrimary : white,
                            ),
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = Settings();
                            currentTab = 3;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ImageIcon(
                              const AssetImage(person_icon),
                              color:
                                  currentTab == 3 ? colorPrimary : Colors.grey,
                            ),
                            CircleAvatar(
                              radius: 2,
                              backgroundColor:
                                  currentTab == 3 ? colorPrimary : white,
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
