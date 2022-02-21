// ignore_for_file: unrelated_type_equality_checks
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weisle/emergencySetup/setUp/setUpProvider.dart';
import 'package:weisle/ui/constants/asset_images.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/widgets/custom_fields.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/navigtion.dart';
import 'package:weisle/utils/base_provider.dart';
import 'package:weisle/utils/index.dart';
import 'package:weisle/ui/screens/activity_report.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SetUp extends StatefulWidget {
  const SetUp({Key? key}) : super(key: key);

  @override
  _SetUpState createState() => _SetUpState();
}

class _SetUpState extends State<SetUp> {
  // final items = [
  //   'Medical',
  //   'Robbery',
  //   'Fire',
  //   'Assault',
  //   'Kidnap',
  //   'Accident',
  //   'Natural Disaster',
  //   'Other',
  //   'Notes'
  // ];
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
                Image.asset("assets/icons/headericons.png",
                    height: 30, width: 30),
                const YMargin(10),
                SideSpace(
                  0,
                  0,
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    InkWell(
                        onTap: () {
                          navigate(context, const Tracker());
                        },
                        child: IconOf(Icons.alarm_add_rounded, black, 30))
                  ]),
                ),
                const YMargin(10),
                Image.asset(
                  'assets/images/individual_person.png',
                  height: 120,
                ),
                const YMargin(20),
                TextOf(
                    'Hello User, Congrats on Successfully signing up.\n Tap on any of the emergency icons to quickly set up.',
                    10,
                    FontWeight.w500,
                    black),
                const YMargin(20),
                Material(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 6.0,
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: litePink,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
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
                          height: 100,
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
                  value.setemergencyCat = selectedItem;
                  return PlainTextField(
                      onchanged: (e) => value.setuserNames = e,
                      leading:
                          const Icon(Icons.person, color: Color(0xffFF2156)),
                      hint: "Username");
                }),
                const YMargin(10),
                Consumer<SetUpProvider>(builder: (context, value, child) {
                  return PlainTextField(
                      onchanged: (e) => value.setuserContacts = e,
                      leading: const Icon(Icons.phone_android_rounded,
                          color: Color(0xffFF2156)),
                      hint: "Phone number");
                }),
                const YMargin(10),
                Material(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 6.0,
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: litePink,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          child: Center(
                            child: SideSpace(
                              10,
                              10,
                              TextOf('Default\nMessage', 20, FontWeight.w500,
                                  white),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: colorPrimary,
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
                          height: 100,
                          decoration: BoxDecoration(
                              color: litePink,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const XMargin(5),
                                      TextOf('$selectedItem \nMessage', 20,
                                          FontWeight.w500, white),
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
                const YMargin(20),
                Consumer<SetUpProvider>(builder: ((context, value, child) {
                  return InkWell(
                    onTap: () async {
                      value.SetUp(context);
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
                }))
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
class CategoriesProvider extends BaseProvider {
  List<CategoriesModel> categoriesList = [];

  CategoriesProvider() {
    getCategories();
  }
  void getCategories() async {
    try {
      setLoading = true;
      const CircularProgressIndicator();
      var getCategoriesResponse = await emergencyApiBasics.getCategories();
      List listFromCatResponse = List.from(getCategoriesResponse['data']);
      print(listFromCatResponse);
      categoriesList = listFromCatResponse
          .map((json) => CategoriesModel.fromJson(json))
          .toList();
      setLoading = false;
    } catch (e) {
      print("FAILED TO FETCHH CATEGORIES..... $e");
    }
  }
}

// ignore: must_be_immutable
class CategoriesPage extends StatefulWidget {
  CategoriesPage({Key? key}) : super(key: key);
  static String? catImage;
  static String? id;
  static String? defaultMsg;
  static String? categoryName;
  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  // @override
  // void initState() {
  //   categoriesProvider.getCategories();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Consumer<CategoriesProvider>(builder: (context, value, child) {
          return SideSpace(
              30,
              20,
              !value.loading
                  ? Column(
                      children: [
                        TextOf('Select category', 20, FontWeight.w500, black),
                        const YMargin(10),
                        const Divider(),
                        Expanded(
                          child: SizedBox(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: value.categoriesList.length,
                                itemBuilder:
                                    (BuildContext context, int indexPosition) {
                                  CategoriesModel categories =
                                      value.categoriesList[indexPosition];

                                  categories.id == '1'
                                      ? CategoriesPage.catImage == medical
                                      : categories.id == '2'
                                          ? CategoriesPage.catImage == robbery
                                          : categories.id == '3'
                                              ? CategoriesPage.catImage == fire
                                              : categories.id == '4'
                                                  ? CategoriesPage.catImage ==
                                                      assault
                                                  : categories.id == '5'
                                                      ? CategoriesPage
                                                              .catImage ==
                                                          kidnap
                                                      : categories.id == '6'
                                                          ? CategoriesPage
                                                                  .catImage ==
                                                              accident
                                                          : categories.id == '7'
                                                              ? CategoriesPage
                                                                      .catImage ==
                                                                  naturalDisaster
                                                              : categories.id ==
                                                                      '8'
                                                                  ? CategoriesPage
                                                                          .catImage ==
                                                                      note
                                                                  : CategoriesPage
                                                                          .catImage ==
                                                                      nothing;

                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            CategoriesPage.defaultMsg =
                                                categories.defaultMsg;
                                            CategoriesPage.categoryName =
                                                categories.catName;
                                          });
                                          value.getCategories();
                                          Navigator.pop(context);
                                        },
                                        child: Card(
                                            child: Row(
                                          children: [
                                            SideSpace(
                                              20,
                                              20,
                                              Container(
                                                width: 40,
                                                height: 40,
                                                child: Center(
                                                  child: Image.asset(
                                                    CategoriesPage.catImage ??
                                                        nothing,
                                                    color: colorPrimary,
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    border: Border.all(
                                                        color: colorPrimary)),
                                              ),
                                            ),
                                            TextOfDecoration(
                                                categories.catName ?? 'NULL',
                                                20,
                                                FontWeight.w400,
                                                black,
                                                TextAlign.left),
                                          ],
                                        )),
                                      ),
                                      const YMargin(20)
                                    ],
                                  );
                                }),
                          ),
                        )
                      ],
                    )
                  : Center(
                      child: Column(
                      children: [
                        const CircularProgressIndicator(),
                        const YMargin(10),
                        TextOf(
                            'Getting categories..', 20, FontWeight.w400, black)
                      ],
                    )));
        }),
      ),
    );
  }
}
