import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/widgets/margin.dart';

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
              Image.asset("assets/icons/headericons.png",
                  height: 30, width: 30),
              Text("Whats your emergency?",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal)),
              const YMargin(20),
              Text("Long press on any of the emergency icons to send a message",
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal)),
              const YMargin(30),
              getGridView(),
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
        },
        child: Material(
          elevation: 2.0,
          borderRadius: BorderRadius.circular(5.0),
          child: Container(
            color: _selectedIndex == index ? colorPrimary : white,
            child: Padding(
              padding: const EdgeInsets.only(left: 5, top: 20, right: 5),
              child: Container(
                color: white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(icon, height: 35, width: 35),
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
      ),
    );
  }
}