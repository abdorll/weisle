import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weisle/customer/sign_in.dart';
import 'package:weisle/emergencySetup/setUp/setUp.dart';
import 'package:weisle/ui/constants/asset_images.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:weisle/ui/widgets/header.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/navigtion.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: ListView(
            shrinkWrap: true,
            children: [
              const Header(),
              const YMargin(5),
              Image.asset(
                hello_user,
                height: 140,
              ),
              Consumer<SignInProvider>(builder: (context, value, child) {
                return TextOfDecoration('Hello ${value.username}', 12,
                    FontWeight.w700, black, TextAlign.center);
              }),
              TextOfDecoration("What's your emergency?", 12, FontWeight.w700,
                  black, TextAlign.center),
              TextOfDecoration(
                  '(Long press on any of the emergency icons to send a message)',
                  12,
                  FontWeight.w700,
                  black,
                  TextAlign.center),
              const YMargin(30),
              getGridView(),
              const YMargin(20),
            ],
          ),
        ),
      ),
    );
  }

  Widget getGridView() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      primary: false,
      childAspectRatio: 0.95,
      crossAxisSpacing: 2,
      mainAxisSpacing: 21,
      children: [
        createTile(
            0, _selectedIndex, true, "Medical", "assets/icons/medical.png"),
        createTile(1, _selectedIndex, true, "Robbery", "assets/icons/gun.png"),
        createTile(2, _selectedIndex, true, "Fire", "assets/icons/fire.png"),
        createTile(
            3, _selectedIndex, true, "Assault", "assets/icons/hammer.png"),
        createTile(4, _selectedIndex, true, "Kidnap", "assets/icons/alarm.png"),
        createTile(
            5, _selectedIndex, true, "Accident", "assets/icons/ambulance.png"),
        createTile(6, _selectedIndex, true, "Natural Disaster",
            "assets/icons/person.png"),
        createTile(
            7, _selectedIndex, true, "Others", "assets/icons/medical.png"),
        createTile(8, _selectedIndex, true, "Notes", "assets/icons/notes.png"),
      ],
    );
  }

  int _selectedIndex = -1;
  Widget createTile(
      int index, int selectedIndex, bool isEven, String title, String icon) {
    return Padding(
      padding: EdgeInsets.only(
          left: isEven ? 15 : 15, right: isEven ? 15 : 15, top: 1, bottom: 1),
      child: GestureDetector(
        onLongPress: () {
          setState(() {
            _selectedIndex = index;
          });
          _selectedIndex == index ? navigate(context, const SetUp()) : () {};
        },
        child: Stack(
          children: [
            Material(
              color: white,
              elevation: 2.0,
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                width: 100,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, top: 20, right: 5),
                  child: Container(
                    color: white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(icon,
                            height: 35, width: 35, color: colorPrimary),
                        Column(
                          children: <Widget>[
                            Text(
                              title,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: textColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 0,
                left: 70,
                bottom: 120,
                right: 0,
                child: _selectedIndex == index
                    ? IconOf(Icons.check_circle_rounded, colorPrimary, 20)
                    : Container())
          ],
        ),
      ),
    );
  }
}
