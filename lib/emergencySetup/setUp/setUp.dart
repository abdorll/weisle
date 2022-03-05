// ignore_for_file: unrelated_type_equality_checks
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weisle/customer/sign_in.dart';
import 'package:weisle/customer/welcome_back.dart';
import 'package:weisle/emergencySetup/setUp/categorySetup.dart';
import 'package:weisle/emergencySetup/setUp/setUpProvider.dart';
import 'package:weisle/ui/constants/asset_images.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/widgets/header.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/navigtion.dart';
import 'package:weisle/ui/screens/activity_report.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SetUp extends StatefulWidget {
  const SetUp({Key? key}) : super(key: key);

  @override
  _SetUpState createState() => _SetUpState();
}

class _SetUpState extends State<SetUp> {
  int current = 0;
  String selectedItem = CategoriesPage.categoryName ?? 'Undefined';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Consumer<CategoriesProvider>(builder: (context, value, child) {
        // List<DropdownMenuItem<Object>> items;
        // items = value.categoriesList.first;
        return SideSpace(
          10,
          0,
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const YMargin(10),
                const Header(),
                const YMargin(10),
                Image.asset(
                  'assets/images/individual_person.png',
                  height: 120,
                ),
                const YMargin(20),
                TextOf(
                    'Hello User, Congrats on Successfully signing up.\n Tap on any of the emergency icons to quickly set up.',
                    15,
                    FontWeight.w600,
                    black),
                const YMargin(20),
                Material(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 6.0,
                  child: Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: litePink,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Container(
                          height: 80,
                          child: const XMargin(22),
                          decoration: BoxDecoration(
                              color: colorPrimary,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20))),
                        ),
                        const XMargin(20),
                        TextOf('Emergency', 20, FontWeight.w400, ash),
                        const Expanded(child: const XMargin(2)),
                        Container(
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const XMargin(2),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    child: SideSpace(
                                      10,
                                      5,
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Image.asset(
                                                  CategoriesPage.catImage ??
                                                      nothing,
                                                  color: colorPrimary,
                                                  height: 40,
                                                  width: 40),
                                              TextOf(
                                                  CategoriesPage.categoryName ??
                                                      'Select Cat',
                                                  20,
                                                  FontWeight.w500,
                                                  colorPrimary)
                                            ],
                                          ),
                                          IconOf(Icons.arrow_drop_down_rounded,
                                              colorPrimary, 20)
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      navigate(context, CategoriesPage());
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    ),
                  ),
                ),
                const YMargin(20),
                Consumer<SetUpProvider>(builder: (context, value, child) {
                  value.setemergencyCat =
                      CategoriesPage.categoryName ?? 'Undefined';
                  return const YMargin(0);
                }),
                const YMargin(10),
                Material(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 6.0,
                  child: Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: litePink,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Container(
                          height: 80,
                          child: Center(
                            child: SideSpace(
                              10,
                              10,
                              TextOf('Default\nMessage', 20, FontWeight.w500,
                                  white),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: blackGrey,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        const XMargin(10),
                        Expanded(
                          child: TextOfDecoration(
                              CategoriesPage.defaultMsg ?? "No message yet",
                              20,
                              FontWeight.w400,
                              ash,
                              TextAlign.left),
                        )
                      ],
                    ),
                  ),
                ),
                const YMargin(20),
                Consumer<SetUpProvider>(builder: ((context, value, child) {
                  return Column(
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(20),
                        elevation: 6.0,
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                              color: litePink,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const XMargin(5),
                                      TextOf(
                                          '${CategoriesPage.categoryName ?? "Undefined"} \nMessage',
                                          20,
                                          FontWeight.w500,
                                          white),
                                      const XMargin(5),
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: colorPrimary,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              const XMargin(10),
                              Expanded(
                                child: TextFormField(
                                  onChanged: (e) {
                                    value.setemergencyMsg = e;
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Emergency message",
                                      hintStyle: GoogleFonts.poppins(
                                        color: ash,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      fillColor: litePink,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(90))),
                                ),
                              ),
                              const XMargin(10),
                            ],
                          ),
                        ),
                      ),
                      const YMargin(10),
                    ],
                  );
                })),
                const YMargin(10),
                Consumer<SetUpProvider>(builder: ((context, value, child) {
                  return InkWell(
                    onTap: () {
                      value.emrgencyAndCategoryCheck(context);
                    },
                    child: MediumSizeButton(
                        () {},
                        TextOf('Continue', 29, FontWeight.w500, white),
                        colorPrimary,
                        90,
                        30,
                        10,
                        4),
                  );
                })),
                GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WelcomeBack()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextOf('Not now,', 15, FontWeight.w400, black),
                        TextOf(' later', 15, FontWeight.w400, colorPrimary),
                      ],
                    )),
                const YMargin(10)
              ],
            ),
          ),
        );
      })),
    );
  }
}

//----------------------------------------------------CATEGORIES
class CategoriesModel {
  String? id;
  String? catName;
  String? defaultMsg;

  CategoriesModel({
    this.id,
    this.catName,
    this.defaultMsg,
  });

  CategoriesModel.fromJson(Map<String, dynamic> json)
      : catName = json['catName'] ?? 'Categoty name',
        id = json['id'] ?? 'Id',
        defaultMsg = json['defaultMsg'] ?? "Default msg";
}

////---------------------------------------CATEGORIES PROVIDER

// ignore: must_be_immutable

void wait() async {
  await Future.delayed(Duration(seconds: 3));
}
