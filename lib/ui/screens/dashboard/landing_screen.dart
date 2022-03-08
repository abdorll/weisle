// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:weisle/ui/constants/asset_images.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/customer/profile.dart';
import 'package:weisle/ui/screens/activity_report.dart';
import 'package:weisle/ui/screens/dashboard/settings.dart';
import 'home_page.dart';

class LandingScreen extends StatefulWidget {
  //final _myNavController = Get.put(NavController());

  LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  List<Widget> pages = const [
    Homepage(),
    Report(),
    ProfileScreen(),
    Settings(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: colorPrimary,
        backgroundColor: Colors.white,
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(home_icon),
              ),
              label: "."),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search_outlined,
                size: 30,
              ),
              label: "."),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(broadcast_icon),
              ),
              label: "."),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(person_icon),
              ),
              label: ".")
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
      ),
      body: Container(
        child: pages.elementAt(_selectedIndex),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: white,
        child: Image.asset(weisle_logo, height: 50),
        onPressed: () {
          //Overlay.of(context).insert(entry);
        },
      ),
    );
  }
}
