import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
        connectTimeout: 60 * 1000,
        receiveTimeout: 60 * 100));
  }

  static Future<Response> getData(
      {@required String? url, required dynamic query}) async {
    return dio.get(url!, queryParameters: query);
  }
  //  https://newsapi.org/v2/top-headlines?country=us&apiKey=aaf8b3fc7f9c4a06befb404cb403819f
}
