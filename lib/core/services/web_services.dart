import 'dart:convert';

import 'package:colored_log/colored_log.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../exceptions/app_exception.dart';

enum RequestType { get, post, put, delete }

//! Dio Api Caller ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Future<void> callWebApi(
  String url, {
  RequestType requestType = RequestType.get,
  required Function(Response response) onResponse,
  VoidCallback? finalCallback,
  Function(AppException e)? onError,
  Map<String, dynamic>? data,
  Map<String, dynamic>? queryParameters,
  bool isFormData = false,
  bool removeToken = false,
}) async {
  try {
    ColoredLog.cyan(url, name: '[${requestType.name.toUpperCase()}] Url');

    if (data is Map && data != null) {
      ColoredLog.green(
        isFormData ? data : jsonEncode(data),
        name: '[${requestType.name.toUpperCase()}] Payload ',
      );
    }

    if (queryParameters != null) {
      ColoredLog.white(queryParameters, name: "QueryParameters");
    }

    Map<String, String> headers = {
      "Content-Type":
          !isFormData
              ? "application/json"
              : "multipart/form-data; boundary=<calculated when request is sent>",
    };

    // if ((SharedPrefsHelper.token != null && SharedPrefsHelper.token != '') &&
    //     !removeToken) {
    //   headers['Authorization'] = 'Bearer ${SharedPrefsHelper.token}';
    // }

    ColoredLog.magenta(
      headers,
      name: '[${requestType.name.toUpperCase()}] Headers ',
    );

    late Response response;

    final Dio dioClient = Dio();

    if (requestType == RequestType.get) {
      response = await dioClient.get(
        url,
        data: isFormData ? FormData.fromMap(data ?? {}) : data,
        options: Options(headers: headers),
        queryParameters: queryParameters,
      );
    } else if (requestType == RequestType.post) {
      response = await dioClient.post(
        url,
        data: isFormData ? FormData.fromMap(data ?? {}) : data,
        options: Options(headers: headers),
        queryParameters: queryParameters,
      );
    } else if (requestType == RequestType.put) {
      response = await dioClient.put(
        url,
        data: isFormData ? FormData.fromMap(data ?? {}) : data,
        options: Options(headers: headers),
        queryParameters: queryParameters,
      );
    } else if (requestType == RequestType.delete) {
      response = await dioClient.delete(
        url,
        data: isFormData ? FormData.fromMap(data ?? {}) : data,
        options: Options(headers: headers),
        queryParameters: queryParameters,
      );
    }

    if (response.statusCode == 200 || response.statusCode == 201) {
      ColoredLog.yellow(
        name:
            'Response ${response.statusCode == null ? '' : '[${response.statusCode}]'}',
        response.data is Map<String, dynamic>
            ? jsonEncode(response.data)
            : response.data,
      );
      await onResponse(response);
    }
  } catch (e) {
    try {
      AppExceptionHandler.handleApiErrors(e);
    } on AppException catch (err) {
      err.printError;
      ColoredLog.red(
        e,
        name: '[${requestType.name.toUpperCase()}] Error Handler',
      );
      if (onError != null) {
        onError.call(err);
      } else {
        rethrow;
      }
    }
  } finally {
    finalCallback?.call();
  }
}
