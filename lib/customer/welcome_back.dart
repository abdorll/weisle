import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weisle/customer/sign_in.dart';
import 'package:weisle/helpers/Alerts.dart';
import 'package:weisle/ui/constants/asset_images.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/screens/welcome_screens/onboarding_screen.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:weisle/ui/widgets/custom_fields.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weisle/ui/widgets/navigtion.dart';
import 'sign_up.dart';

class WelcomeBack extends StatefulWidget {
  const WelcomeBack({Key? key}) : super(key: key);

  @override
  _WelcomeBackState createState() => _WelcomeBackState();
}

class _WelcomeBackState extends State<WelcomeBack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: SafeArea(
            child: Consumer<SignInProvider>(
          builder: ((context, value, child) => SideSpace(
                10,
                10,
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        WeisleHeader(
                            Image.asset(
                              weisle_logo,
                              height: 30,
                            ),
                            Container(),
                            Container()),
                        const YMargin(20),
                        TextOf('Welcome back', 30, FontWeight.w600, black),
                        const YMargin(10),
                        Image.asset(
                          welcome_back,
                          height: 200,
                        ),
                        PlainTextField(
                            onchanged: (e) => value.setusername = e,
                            leading: const Icon(Icons.person,
                                color: Color(0xffFF2156)),
                            hint: "Username"),
                        PasswordField(
                            onchanged: (e) => value.setPasword = e,
                            leading: const Icon(Icons.lock,
                                color: Color(0xffFF2156)),
                            hint: "Password"),
                        const YMargin(30),
                        InkWell(
                            onTap: () {
                              value.login(context);
                            },
                            child: Container(
                              width: 270,
                              child: Center(
                                child: SideSpace(0, 10,
                                    TextOf('LOGIN', 40, FontWeight.w800, ash)),
                              ),
                              decoration: BoxDecoration(
                                  color: colorPrimary,
                                  border: Border.all(color: colorPrimary),
                                  borderRadius: BorderRadius.circular(20)),
                            )),
                        const YMargin(5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextOf("Don't have an account? ", 15,
                                FontWeight.w500, ash),
                            InkWell(
                              onTap: () {
                                navigate(context, const SignUp());
                              },
                              child: TextOf(
                                  "SIGNUP ", 15, FontWeight.w500, colorPrimary),
                            ),
                          ],
                        )
                        // FormButton(
                        //     enabled: true,
                        //     text: "Login",
                        //     function: () {
                        //       value.login(context);
                        //     }),
                      ],
                    ),
                  ),
                ),
              )),
        )));
  }
}

class SeconWelcomeScreen extends StatelessWidget {
  const SeconWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const YMargin(20),
            SideSpace(
                10,
                0,
                Image.asset(
                  weisle_logo,
                  height: 250,
                )),
            const YMargin(20),
            TextOf('Find help', 30, FontWeight.w700, black),
            const YMargin(30),
            TextOfDecoration(
                'Long press the button or shake your phone thrice to generate emergency SOS request.',
                20,
                FontWeight.w400,
                ash,
                TextAlign.center),
            Expanded(child: const YMargin(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<SignInProvider>(builder: ((context, value, child) {
                  return InkWell(
                    onTap: () {
                      value.login(context);
                    },
                    child: Card(
                      child: SideSpace(
                          10, 5, TextOf('Skip', 20, FontWeight.w500, ash)),
                    ),
                  );
                })),
                InkWell(
                  onTap: () => navigate(context, const OnboardingScreen()),
                  child: Card(
                    child: SideSpace(10, 5,
                        TextOf('Next', 20, FontWeight.w500, colorPrimary)),
                  ),
                )
              ],
            ),
            const YMargin(10),
          ],
        ),
      ),
    );
  }
}
