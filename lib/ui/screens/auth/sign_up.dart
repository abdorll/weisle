import 'package:flutter/material.dart';
import 'package:weisle/ui/constants/colors.dart'; 
import 'package:weisle/ui/screens/auth/sign_in.dart';
import 'package:weisle/ui/widgets/custom_fields.dart';
import 'package:weisle/ui/widgets/form_button.dart';
import 'package:weisle/ui/widgets/margin.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
            children: [
              SizedBox(
                  height: 163,
                  width: 129,
                  child: Image.asset("assets/images/signIn.png")),
              const PlainTextField(
                  leading:
                      Icon(Icons.person_add_alt_1, color: Color(0xffFF2156)),
                  hint: "Fullname"),
              const PlainTextField(
                  leading: Icon(Icons.phone, color: Color(0xffFF2156)),
                  hint: "Phone Number"),
              const PlainTextField(
                  leading: Icon(Icons.person, color: Color(0xffFF2156)),
                  hint: "Username"),
              const PlainTextField(
                  leading: Icon(Icons.code, color: Color(0xffFF2156)),
                  hint: "Referral Code"),
              const PasswordField(
                  leading: Icon(Icons.lock, color: Color(0xffFF2156)),
                  hint: "Password"),
              const PasswordField(
                  leading: Icon(Icons.lock, color: Color(0xffFF2156)),
                  hint: "Confirm Password"),
              const YMargin(20),
              FormButton(text: "Register", function: () {}),
              const YMargin(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text("Already having an account?")),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: Text(
                        "LOGIN",
                        style: TextStyle(color: colorPrimary),
                      ))
                ],
              )
            ]),
      ),
    );
  }
}
