import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_getx_mvvm/data/app_exceptions.dart';
import 'package:flutter_getx_mvvm/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        throw InvalidUrlException();
      default:
        throw FetchDataException(
            "Error while communicating with server ${response.statusCode}");
    }
  }

  @override
  Future<dynamic> getApi(String Url) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(
            Uri.parse(
              Url,
            ),
          )
          .timeout(
            const Duration(
              seconds: 20,
            ),
          );
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on ServerException {
      throw ServerException();
    } on TimeoutException {
      throw RequestTimeOut();
    }

    return responseJson;
  }

  @override
  Future<dynamic> postApi(String Url, var data) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(
            Uri.parse(Url),
            body: data,
          )
          .timeout(
            const Duration(
              seconds: 20,
            ),
          );
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on ServerException {
      throw ServerException();
    } on TimeoutException {
      throw RequestTimeOut();
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }
}
