import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weisle/helpers/Alerts.dart';
import 'package:weisle/utils/endpoints.dart';

class ApiBasics {
  Dio _dio = Dio();
  static final _apiBasics = ApiBasics.createInstanvce();
  ApiBasics.createInstanvce();

  factory ApiBasics() {
    _apiBasics._dio.interceptors.add(PrettyDioLogger(
        request: true, requestBody: true, requestHeader: true, compact: true));
    return _apiBasics;
  }

  Future makeGetRequest(url, header) async {
    return await _dio
        .get(url, options: Options(headers: header ?? getHeaders()))
        .then((value) => value.data);
  }

  Future makePostRequest(url, header, data) async {
    return await _dio
        .post(url,
            data: data,
            options:
                // ignore: prefer_if_null_operators
                Options(headers: header ?? await getHeaders()))
        .then((value) => value.data);
  }

  static getHeaders() {
    return {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
      'contentType': 'application/json',
    };
  }
}
