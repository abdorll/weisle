import 'package:flutter/material.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/widgets/form_button.dart';
import 'package:weisle/ui/widgets/margin.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.chevron_left,
            size: 35,
            color: Colors.black,
          ),
          actions: const [Icon(Icons.alarm)],
          title: const Text("Profile",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(color: white, height: 95, width: 100),
                  const Text("Tinuke Akinlawon"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.location_city_sharp, color: colorPrimary),
                      const Text("Badagry, Lagos State"),
                    ],
                  ),
                  const YMargin(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      OnboardingButton(
                          color: idColor,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Icon(Icons.person_add_alt),
                              Text("Weizle ID")
                            ],
                          )),
                      OnboardingButton(
                          color: colorPrimary,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Icon(Icons.edit),
                              Text("Edit Profile")
                            ],
                          )),
                    ],
                  )
                ])
          ],
        ),
      ),
    );
  }
}
