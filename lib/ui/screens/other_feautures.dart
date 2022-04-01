import 'package:flutter/material.dart';
import 'package:weisle/ui/constants/asset_images.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:weisle/ui/widgets/margin.dart';

class OtherFeatures extends StatelessWidget {
  const OtherFeatures({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: SideSpace(
            20,
            10,
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextOfDecoration('Other feautures', 24, FontWeight.w700,
                      black, TextAlign.left),
                  const YMargin(20),
                  OtherFeauturesContents(
                    title: 'Easy connect',
                    assetName: easy_connect,
                    titleDesctiption:
                        'This connects you to the nearest and most reliable stations closest to you using your real time location.',
                    buttonDescript: 'Connect now!',
                    buttonAction: () {},
                  ),
                  const YMargin(20),
                  OtherFeauturesContents(
                    title: 'House surveillance',
                    assetName: house_survey,
                    titleDesctiption:
                        'This feature allows you to connect the app to your indoor surveillance devices. Monitor your house on-the-go!',
                    buttonDescript: 'Connect now!',
                    buttonAction: () {},
                  ),
                  const YMargin(20),
                  OtherFeauturesContents(
                    title: 'Get Insurance',
                    assetName: get_insurance,
                    titleDesctiption:
                        'This feature allows you to buy Health and Property Insurance from the tip of your fingers! Fast and easy at affordable rates.',
                    buttonDescript: 'Buy now!',
                    buttonAction: () {},
                  ),
                  const YMargin(20),
                  OtherFeauturesContents(
                    title: 'First Aid tips',
                    assetName: first_aid_tips,
                    titleDesctiption:
                        'Learn first hand tips to combact household and environmental accidents.',
                    buttonDescript: 'Start learning',
                    buttonAction: () {},
                  ),
                  const YMargin(20),
                  OtherFeauturesContents(
                    title: 'Share current location',
                    assetName: first_aid_tips,
                    titleDesctiption:
                        'Share your current location with friends and family. Don’t be a lone tree....lorem ipsum',
                    buttonDescript: 'Share',
                    buttonAction: () {},
                  ),
                  const YMargin(20),
                  OtherFeauturesContents(
                    title: 'Weather forecasts',
                    assetName: weather_forecast,
                    titleDesctiption:
                        'Stop! before you step out of the house, check your weather forecasts.. you don’t want to come back drenched!',
                    buttonDescript: 'Connect now',
                    buttonAction: () {},
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class OtherFeauturesContents extends StatelessWidget {
  OtherFeauturesContents({
    required this.title,
    required this.assetName,
    required this.titleDesctiption,
    required this.buttonDescript,
    required this.buttonAction,
    Key? key,
  }) : super(key: key);
  String title;
  String assetName;
  String titleDesctiption;
  String buttonDescript;
  Function buttonAction;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(assetName),
            const XMargin(10),
            TextOf(title, 22, FontWeight.w500, black)
          ],
        ),
        const YMargin(10),
        TextOfDecoration(
            titleDesctiption, 17, FontWeight.w400, black, TextAlign.left),
        const YMargin(10),
        InkWell(
          onTap: () {
            buttonAction();
          },
          child: Container(
            height: 30,
            width: 150,
            decoration: BoxDecoration(
                color: colorPrimary,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: colorPrimary)),
            child: Center(
                child: TextOf(buttonDescript, 20, FontWeight.w500, white)),
          ),
        )
      ],
    );
  }
}
