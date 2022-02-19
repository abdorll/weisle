// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:weisle/helpers/alerts.dart';
import 'package:weisle/ui/constants/asset_images.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/screens/settings/accountLookup.dart';
import 'package:weisle/ui/screens/settings/setSqa.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/navigtion.dart';
import 'package:weisle/utils/base_provider.dart';
import 'package:weisle/utils/index.dart';
import 'package:weisle/ui/screens/activity_report.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SetSQA extends StatefulWidget {
  const SetSQA({Key? key}) : super(key: key);

  @override
  _SetSQAState createState() => _SetSQAState();
}

class _SetSQAState extends State<SetSQA> {
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
                //----------------------------SETUP PROVIDER STARTS HERE------------------------
                //----------------------------SETUP PROVIDER STARTS HERE------------------------
                //----------------------------SETUP PROVIDER STARTS HERE------------------------
                //----------------------------SETUP PROVIDER STARTS HERE------------------------
                //----------------------------SETUP PROVIDER STARTS HERE------------------------
                //----------------------------SETUP PROVIDER STARTS HERE------------------------
                //----------------------------SETUP PROVIDER STARTS HERE------------------------
                //----------------------------SETUP PROVIDER STARTS HERE------------------------
                //----------------------------SETUP PROVIDER STARTS HERE------------------------
                Consumer<SetSQaProvider>(builder: ((context, value, child) {
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
                                    value.setsecAnswer = e;
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
                //----------------------------SETUP PROVIDER ENDS HERE------------------------
                //----------------------------SETUP PROVIDER ENDS HERE------------------------
                //----------------------------SETUP PROVIDER ENDS HERE------------------------
                //----------------------------SETUP PROVIDER ENDS HERE------------------------
                //----------------------------SETUP PROVIDER ENDS HERE------------------------
                //----------------------------SETUP PROVIDER ENDS HERE------------------------
                //----------------------------SETUP PROVIDER ENDS HERE------------------------
                //----------------------------SETUP PROVIDER ENDS HERE------------------------
                //----------------------------SETUP PROVIDER ENDS HERE------------------------
                const YMargin(20),
                InkWell(
                  onTap: () async {
                    // value.;
                    //navigate(context, const EmergencySetup());
                  },
                  child: MediumSizeButton(
                      () {},
                      TextOf('Continue', 29, FontWeight.w500, white),
                      colorPrimary,
                      90,
                      30,
                      10,
                      4),
                )
              ],
            ),
          ),
        );
      })),
    );
  }
}

//---------------------------------------------setSQA Provider----------------------------------------
//---------------------------------------------setSQA Provider----------------------------------------
//---------------------------------------------setSQA Provider----------------------------------------
//---------------------------------------------setSQA Provider----------------------------------------
//---------------------------------------------setSQA Provider----------------------------------------
//---------------------------------------------setSQA Provider----------------------------------------
//---------------------------------------------setSQA Provider----------------------------------------
//---------------------------------------------setSQA Provider----------------------------------------
//---------------------------------------------setSQA Provider----------------------------------------
//---------------------------------------------setSQA Provider----------------------------------------
//---------------------------------------------setSQA Provider----------------------------------------
//---------------------------------------------setSQA Provider----------------------------------------
//---------------------------------------------setSQA Provider----------------------------------------
//---------------------------------------------setSQA Provider----------------------------------------
//---------------------------------------------setSQA Provider----------------------------------------
//---------------------------------------------setSQA Provider----------------------------------------
//---------------------------------------------setSQA Provider----------------------------------------
//---------------------------------------------setSQA Provider----------------------------------------
//---------------------------------------------setSQA Provider----------------------------------------
//---------------------------------------------setSQA Provider----------------------------------------
//---------------------------------------------setSQA Provider----------------------------------------
//---------------------------------------------setSQA Provider----------------------------------------

//-----------------------------------------SetSQaProvider PROVIDER
class SetSQaProvider extends BaseProvider {
  String? _secQuestion;
  String? _secAnswer;
  bool formValidity = false;

  String get secQuestion => _secQuestion ?? '';
  String get secAnswer => _secAnswer ?? '';

  set setsecQuestion(String secQuestion) {
    _secQuestion = secQuestion;
    checkFormValidity();
    notifyListeners();
  }

  set setsecAnswer(String secAnswer) {
    _secAnswer = secAnswer;
    checkFormValidity();
    notifyListeners();
  }

  void checkFormValidity() {
    if ((_secQuestion != null) && (_secAnswer != null)) {
      formValidity = true;
    } else {
      formValidity = false;
    }
    notifyListeners();
  }

  void setSQA(BuildContext context) async {
    var box = await Hive.openBox(weisleUserBox);
    String name = box.get(weisleUserName);
    try {
      if (_secQuestion == null || _secAnswer == null) {
        Alerts.errorAlert(context, 'All fields are required', () {
          Navigator.pop(context);
        });
      } else {
        Alerts.loadingAlert(context, 'Setting SQA...');
        FocusScope.of(context).unfocus();
        setLoading = true;
        var registerResponse = await customerApiBasic.setSqa(
            userName: name, secQuestion: _secQuestion, secAnswer: _secAnswer);
        if (registerResponse['resposeCode'] == '00') {
          setLoading = false;
          print('Request Successful');
          navigate(context, const AccountLookup());
        } else if ((registerResponse['resposeCode'] == '01')) {
          setLoading = false;
          notifyListeners();
          Alerts.errorAlert(context, registerResponse['message'], () {
            Navigator.pop(context);
          });

          // print("Weisle register Response is $registerResponse");
        } else {
          setLoading = false;
          notifyListeners();
          Alerts.errorAlert(context, registerResponse['message'], () {
            Navigator.pop(context);
          });
        }
      }
    } catch (e) {
      setLoading = false;
      // ignore: avoid_print
      // print("Weisle error: $e");
      Alerts.errorAlert(context, 'Something went wrong', () {
        Navigator.pop(context);
      });
    }
  }

  SetSQaProvider() {
    checkFormValidity();
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
      : catName = json['catName'],
        id = json['id'],
        defaultMsg = json['defaultMsg'];
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
  @override
  void initState() {
    categoriesProvider.getCategories();
    super.initState();
  }

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
