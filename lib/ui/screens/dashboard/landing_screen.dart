import 'dart:io';

import 'package:flutter/material.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/screens/profile/profile.dart';
import 'package:weisle/ui/screens/activity_report.dart';
import 'package:weisle/ui/screens/settings/setSqa.dart';
import 'package:weisle/ui/screens/settings/settings.dart';
import 'package:weisle/ui/widgets/navigtion.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class LandingScreen extends StatelessWidget {
  final _myNavController = Get.put(NavController());

  LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exit(0),
      child: Scaffold(
        body: Obx(() {
          if (_myNavController.selectedTab.value == 0) {
            return const Homepage();
          } else if (_myNavController.selectedTab.value == 1) {
            return const Report();
          } else if (_myNavController.selectedTab.value == 2) {
            return const ProfileScreen();
          } else if (_myNavController.selectedTab.value == 3) {
            return const SetSQA();
          }
          return Container();
        }),
        bottomNavigationBar: Obx(
          () => Container(
            width: Get.width,
            height: 60,
            padding: const EdgeInsets.fromLTRB(30, 8, 30, 7),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.grey.shade600),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    _myNavController.selectedTab.value = 0;
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.home,
                        size: 30,
                        color: _myNavController.selectedTab.value == 0
                            ? colorPrimary
                            : colorPrimary.withOpacity(0.3),
                      ),
                      Text(
                        'Home',
                        style: GoogleFonts.mulish(
                            fontSize: 10,
                            fontWeight: _myNavController.selectedTab.value == 0
                                ? FontWeight.bold
                                : null),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    _myNavController.selectedTab.value = 1;
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.ac_unit,
                        size: 30,
                        color: _myNavController.selectedTab.value == 1
                            ? colorPrimary
                            : colorPrimary.withOpacity(0.3),
                      ),
                      Text(
                        'Reports',
                        style: GoogleFonts.mulish(
                            fontSize: 10,
                            fontWeight: _myNavController.selectedTab.value == 1
                                ? FontWeight.bold
                                : null),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _myNavController.selectedTab.value = 2;
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.person,
                        size: 30,
                        color: _myNavController.selectedTab.value == 2
                            ? colorPrimary
                            : colorPrimary.withOpacity(0.3),
                      ),
                      Text(
                        'Profile',
                        style: GoogleFonts.mulish(
                            fontSize: 10,
                            fontWeight: _myNavController.selectedTab.value == 2
                                ? FontWeight.bold
                                : null),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    _myNavController.selectedTab.value = 3;
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 30,
                        color: _myNavController.selectedTab.value == 3
                            ? colorPrimary
                            : colorPrimary.withOpacity(0.3),
                      ),
                      Text(
                        'Settings',
                        style: GoogleFonts.mulish(
                            fontSize: 10,
                            fontWeight: _myNavController.selectedTab.value == 3
                                ? FontWeight.bold
                                : null),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
