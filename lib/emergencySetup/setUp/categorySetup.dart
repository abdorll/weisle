import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weisle/emergencySetup/setUp/setUp.dart';
import 'package:weisle/subscription/getSubHistory.dart';
import 'package:weisle/ui/constants/asset_images.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:weisle/utils/base_provider.dart';
import 'package:weisle/utils/index.dart';

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
                                          Navigator.pop(context);
                                          value.getCategories();
                                          wait();
                                          CategoriesPage.defaultMsg =
                                              categories.defaultMsg!;
                                          CategoriesPage.categoryName =
                                              categories.catName!;
                                          // setState(() {

                                          // });
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
                  : GettingLoading('Getting categories...'));
        }),
      ),
    );
  }
}

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
