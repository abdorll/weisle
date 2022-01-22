import 'package:flutter/material.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/screens/dashboard/landing_screen.dart';
import 'package:weisle/ui/widgets/custom_fields.dart';
import 'package:weisle/ui/widgets/form_button.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/navigtion.dart';

import 'sign_up.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
            children: [
              // Text("Welcome", textAlign: TextAlign.center, style: onboardTitle.copyWith(fontSize: 30)),
              SizedBox(
                  height: 322,
                  width: 400,
                  child: Image.asset("assets/images/welcome.png")),
              const PlainTextField(
                  leading: Icon(Icons.person, color: Color(0xffFF2156)),
                  hint: "Username"),
              const PasswordField(
                  leading: Icon(Icons.lock, color: Color(0xffFF2156)),
                  hint: "Password"),
              const YMargin(40),
              FormButton(
                  enabled: true,
                  text: "Login",
                  function: () {
                    navigate(context, LandingScreen());
                  }),
              const YMargin(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                      child: const Text("Dont have an account?")),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(color: colorPrimary),
                      ))
                ],
              )
            ]),
      ),
    );
  }
}
