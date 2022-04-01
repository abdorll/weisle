import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weisle/helpers/Alerts.dart';
import 'package:weisle/utils/endpoints.dart';
import "package:weisle/models.dart";

class ApiBasics {
  Dio _dio = Dio();
  static final _apiBasics = ApiBasics.createInstanvce();
  ApiBasics.createInstanvce();

  factory ApiBasics() {
    _apiBasics._dio.interceptors.add(PrettyDioLogger(
        request: true, requestBody: true, requestHeader: true, compact: true));
    return _apiBasics;
  }

  Future<ApiResponse> makeGetRequest(url, header) async {
    try {
      return await _dio
          .get(url, options: Options(headers: header ?? getHeaders()))
          .then((value) {
        return ApiResponse.fromJSON(
            {'status': true, 'data': value.data, 'message': 'success'});
      });
    } on DioError catch (error) {
      if (error.response == null) {
        return ApiResponse.fromJSON({
          'status': false,
          'data': null,
          'message': 'Poor internet connection'
        });
      }
      return ApiResponse.fromJSON({
        'status': false,
        'data': null,
        'message':
            '${error.response!.data['error'] ?? error.response!.data['message']}'
      });
    } catch (error) {
      return ApiResponse.fromJSON({
        'status': false,
        'data': null,
        'message': 'Error: please try again'
      });
    }
  }

  Future<ApiResponse> makePostRequest(url, header, data) async {
    try {
      return await _dio
          .post(url,
              data: data,
              options:
                  // ignore: prefer_if_null_operators
                  Options(headers: header ?? await getHeaders()))
          .then((value) {
        return ApiResponse.fromJSON(
            {'status': true, 'data': value.data, 'message': 'success'});
      });
    } on DioError catch (error) {
      if (error.response == null) {
        return ApiResponse.fromJSON({
          'status': false,
          'data': null,
          'message': 'Poor internet connection'
        });
      }
      return ApiResponse.fromJSON({
        'status': false,
        'data': null,
        'message':
            '${error.response!.data['error'] ?? error.response!.data['message']}'
      });
    } catch (error) {
      return ApiResponse.fromJSON({
        'status': false,
        'data': null,
        'message': 'Error: please try again'
      });
    }
  }

  static getHeaders() {
    return {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
      'contentType': 'application/json',
    };
  }
}
