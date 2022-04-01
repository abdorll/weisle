import 'package:flutter/material.dart';
import 'package:weisle/customer/sign_in.dart';
import 'package:weisle/customer/sign_up.dart';
import 'package:weisle/logic/local_db/first_time.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:weisle/ui/widgets/form_button.dart';
import 'package:weisle/ui/widgets/margin.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:weisle/ui/widgets/navigtion.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int currentIndex = 0;
  // static const _kDuration = Duration(milliseconds: 300);
  // static const _kCurve = Curves.ease;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: onChangedFunction,
                children: const [
                  OnboardingItem(
                    image: 'assets/images/warning1.png',
                    title: "Weizle",
                    description:
                        "An App Designed to help alert and detect the high rate of crime in the community",
                  ),
                  OnboardingItem(
                    image: 'assets/images/warning2.png',
                    title: "Creating a save environment",
                    description:
                        "This real time security tracking app builds confidence",
                  ),
                  OnboardingItem(
                    image: 'assets/images/warn4.png',
                    title: "Find Help",
                    description:
                        "Long press the button or shake your phone thrice to generate emergency SOS request.",
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Indicator(
                  positionIndex: 0,
                  currentIndex: currentIndex,
                ),
                const XMargin(10),
                Indicator(
                  positionIndex: 1,
                  currentIndex: currentIndex,
                ),
                const XMargin(10),
                Indicator(
                  positionIndex: 2,
                  currentIndex: currentIndex,
                ),
              ],
            ),
            const YMargin(40),
            currentIndex == 2
                ? Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: FormButton(
                        text: "GET STARTED",
                        enabled: true,
                        function: () async {
                          await setFirstTime();
                          navigate(context, const SignUp());
                        }),
                  )
                : FormButton(
                    text: "Skip",
                    textColor: boldTextColor,
                    enabled: true,
                    backgroundColor: white,
                    function: () async {
                      navigateReplaces(context, const SignUp());
                    }),
            const YMargin(50),
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final int positionIndex, currentIndex;
  const Indicator(
      {Key? key, required this.currentIndex, required this.positionIndex})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: positionIndex == currentIndex ? 10 : 8,
      width: positionIndex == currentIndex ? 30 : 8,
      decoration: BoxDecoration(
        border: Border.all(
          color:
              positionIndex == currentIndex ? colorPrimary : inActivIndicator,
        ),
        color: positionIndex == currentIndex ? colorPrimary : inActivIndicator,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}

class OnboardingItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingItem(
      {Key? key,
      required this.description,
      required this.image,
      required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 40, left: 30, right: 30),
              child: Center(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Center(
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: boldTextColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 22)),
            ),
          ),
          Center(
            child: Text(description,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.7),
                )),
          )
        ],
      ),
    );
  }
}
