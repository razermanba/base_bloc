import 'dart:io';

import 'package:bloc_base/data/remote/service/service_constants.dart';
import 'package:bloc_base/di/locator.dart';
import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

class DioNetwork {
  Dio getDio() {
    Dio dio = Dio();
    _mockResponseData(dio);
    dio.options = BaseOptions(
        baseUrl: ServiceConstant.baseUrl,
        contentType: NetworkRequestValues.contentType,
        sendTimeout: ServiceConstant.timeOut,
        connectTimeout: ServiceConstant.timeOut,
        receiveTimeout: ServiceConstant.timeOut);
    dio.interceptors.add(_addInterceptor());
    return dio;
  }

  void _mockResponseData(Dio dio) {
    final dioAdapter = DioAdapter(dio: dio);
    dioAdapter.onPost(
        "/authenticate/1.0",
        (server) => {
              server.reply(
                HttpStatus.ok,
                {
                  "requestId": "",
                  "status": "0",
                  "desc": "SUCCESS",
                  "message": null,
                  "data": {"token": "Token data"}
                },
                delay: const Duration(seconds: 3),
              )
            },
        data: Matchers.any);

    dioAdapter.onPost(
        "/home/1.0",
        (server) => {
              server.reply(
                HttpStatus.ok,
                {
                  "requestId": "799637ab-4bf4-4bc4-86dd-7aa7a36488c7",
                  "status": "0",
                  "desc": "Success",
                  "message": "",
                  "data": [
                    {
                      "id": 1,
                      "title": "Title 1",
                      "description": "Description 1"
                    },
                    {
                      "id": 2,
                      "title": "Title 2",
                      "description": "Description 2"
                    }
                  ]
                },
                delay: const Duration(seconds: 10),
              )
            },
        data: Matchers.any);
  }

  InterceptorsWrapper _addInterceptor() {
    return InterceptorsWrapper(onRequest: (option, handler) {
      option.headers = {
        RequestHeader.tokenKey: token,
        RequestHeader.language: langApp
      };
      Fimber.d("Request:");
      Fimber.d("Log Url request: ${option.baseUrl}");
      Fimber.d("Log header request: ${option.headers.toString()}");
      handler.next(option);
    }, onResponse: (response, handler) {
      Fimber.d(
          "Response: ${response.data?.toString() ?? response.statusCode ?? "logResponseInterceptor empty"}");
      handler.next(response);
    }, onError: (error, handler) {
      Fimber.d("Error: ${error.error?.toString()}");
      handler.next(error);
    });
  }
}
