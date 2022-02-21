// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:weisle/utils/base_provider.dart';
import 'package:weisle/utils/index.dart';

class GetSubscribtionHistoryPage extends StatefulWidget {
  const GetSubscribtionHistoryPage({Key? key}) : super(key: key);

  @override
  _GetSubscribtionHistoryPageState createState() =>
      _GetSubscribtionHistoryPageState();
}

class _GetSubscribtionHistoryPageState
    extends State<GetSubscribtionHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Consumer<GetSubHistoryProvider>(builder: (context, value, child) {
        return !value.loading
            ? ListView.builder(
                itemCount: value.subHistories.length,
                itemBuilder: (context, indexPosition) {
                  GetSubHistoryModel listOfhistories =
                      value.subHistories[indexPosition];
                  return Card(
                    elevation: 6.0,
                    child: Column(
                      children: [
                        TextOf(listOfhistories.planAmt!, 20, FontWeight.w400,
                            black),
                        TextOf(listOfhistories.emergencyCountry!, 20,
                            FontWeight.w400, black),
                        TextOf(listOfhistories.planCurrency!, 20,
                            FontWeight.w400, black),
                        TextOf(listOfhistories.subStatus!, 20, FontWeight.w400,
                            black),
                        TextOf(listOfhistories.txtRef!, 20, FontWeight.w400,
                            black),
                        TextOf(listOfhistories.createdDate!, 20,
                            FontWeight.w400, black),
                      ],
                    ),
                  );
                })
            : Center(
                child: Column(
                  children: [
                    const CircularProgressIndicator(),
                    TextOf('Getting sub histories....', 20, FontWeight.w300,
                        colorPrimary),
                  ],
                ),
              );
      }),
    );
  }
}

class GetSubHistoryProvider extends BaseProvider {
  List<GetSubHistoryModel> subHistories = [];
  GetSubHistoryProvider() {
    getSubHistory();
  }

  void getSubHistory() async {
    try {
      setLoading = true;

      var getSubHistoryResponse = await subscribtionApiBasic.getSubHistory();
      var listFromResponse = List.from(getSubHistoryResponse['data']);
      print(listFromResponse);
      subHistories = listFromResponse
          .map((json) => GetSubHistoryModel.fromJson(json))
          .toList();
      setLoading = false;
    } catch (e) {
      print('FAILE TO FETCH SUB HISTORY $e');
    }
  }
}

class GetSubHistoryModel {
  String? id;
  String? txtRef;
  String? planAmt;
  String? planCurrency;
  String? emergencyCountry;
  String? subStatus;
  String? createdDate;

  GetSubHistoryModel(
      {this.createdDate,
      this.id,
      this.emergencyCountry,
      this.planAmt,
      this.planCurrency,
      this.subStatus,
      this.txtRef});

  GetSubHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 'Id';
    txtRef = json['txtRef'] ?? 'Text ref';
    planAmt = json['planAmt'] ?? 'Plan amount';
    planCurrency = json['planCurrency'] ?? 'Plan currency';
    emergencyCountry = json['emergencyCountry'] ?? 'Emergency country';
    subStatus = json['subStatus'] ?? 'Subscription status';
    createdDate = json['createdDate'] ?? 'Date created';
  }
}
