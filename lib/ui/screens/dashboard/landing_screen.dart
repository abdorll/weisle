// ignore_for_file: prefer_const_constructors_in_immutables, sized_box_for_whitespace, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:weisle/customer/profile.dart';
import 'package:weisle/ui/constants/asset_images.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/subscription/getSubHistory.dart';
import 'package:weisle/ui/screens/activity_report.dart';
import 'package:weisle/ui/screens/dashboard/more.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'home_page.dart';
import 'package:weisle/ui/widgets/navigtion.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int currentTab = 0;
  // final List<Widget> screens = [
  //   const Homepage(),
  //   const Report(),
  //   const GetSubscribtionHistoryPage(),
  //   const ProfileScreen(),
  // ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Homepage();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showWeisleBackDialogue();
        return shouldPop ?? false;
      },
      child: Scaffold(
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        floatingActionButton: FloatingActionButton(
          child: Image.asset(weisle_logo),
          tooltip: 'More',
          onPressed: () {
            navigate(context, More());
          },
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
                                color: currentTab == 0
                                    ? colorPrimary
                                    : Colors.grey,
                              ),
                              TextOf(
                                'Home',
                                14,
                                FontWeight.w400,
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
                              TextOf(
                                'Search',
                                14,
                                FontWeight.w400,
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
                              currentScreen = GetSubscribtionHistoryPage();
                              currentTab = 2;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ImageIcon(
                                const AssetImage(broadcast_icon),
                                color: currentTab == 2
                                    ? colorPrimary
                                    : Colors.grey,
                              ),
                              TextOf(
                                'Activities',
                                14,
                                FontWeight.w400,
                                currentTab == 2 ? colorPrimary : white,
                              ),
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = ProfileScreen();
                              currentTab = 3;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ImageIcon(
                                const AssetImage(person_icon),
                                color: currentTab == 3
                                    ? colorPrimary
                                    : Colors.grey,
                              ),
                              TextOf(
                                'Profile',
                                14,
                                FontWeight.w400,
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
      ),
    );
  }

  Future<bool?> showWeisleBackDialogue() {
    return showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
              title: TextOf("Quitting Weisle", 20, FontWeight.w500, black),
              content: TextOf("Are you sure you want to quit Weisle?", 17,
                  FontWeight.w400, black),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: TextOf("Yes", 17, FontWeight.w500, ash),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: TextOf("No", 17, FontWeight.w500, colorPrimary),
                )
              ],
            ));
  }
}
