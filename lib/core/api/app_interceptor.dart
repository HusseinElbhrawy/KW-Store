import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../app/injector.dart';
import '../database/i_local_data_base.dart';
import '../utils/app_strings.dart';
import '../utils/constant.dart';
import 'end_point.dart';
import 'status_code.dart';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');

    Map<String, dynamic> header = {};
    ILocalDataBase localDataBase = serviceLocator<ILocalDataBase>();
    String? token = await localDataBase.get(AppConstant.kUserUID);
    String? lang =
        await localDataBase.get(AppConstant.kLang) ?? false ? 'ar' : 'en';

    log('lang: $lang', name: 'AppInterceptor');

    if (EndPoint.selectedBaseUrl.compareTo(EndPoint.baseUrl) == 0) {
      header = {
        AppStrings.contentType: AppStrings.applicationJson,
        'lang': lang,
        'Authorization': token,
      };
    } else {
      header = {};
    }

    options
      ..baseUrl = EndPoint.selectedBaseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internetServerError;
      }
      ..sendTimeout = const Duration(seconds: 60)
      ..receiveTimeout = const Duration(seconds: 60)
      ..headers = header;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
