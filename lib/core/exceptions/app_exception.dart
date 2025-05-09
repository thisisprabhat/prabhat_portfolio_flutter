import 'dart:async';
import 'dart:io';

import 'package:colored_log/colored_log.dart';
import 'package:flutter/services.dart';

part 'base_exception.dart';
part 'exception_handler.dart';

class AuthenticationException extends AppException {
  AuthenticationException({
    super.title = 'Authentication Failed',
    super.message = 'Authentication Failed, try again',
  });
}

class InternetSocketException extends AppException {
  final String? errorMessage;
  InternetSocketException(this.errorMessage)
    : super(
        title: 'Unable to establish a connection!',
        message:
            errorMessage ?? 'Please check your network settings and try again.',
        // assetPath: Assets.lottieConnectionError,
      );
}

class ApiHttpExceptionException extends AppException {
  final String? errorMessage;
  ApiHttpExceptionException(this.errorMessage)
    : super(title: 'Error', message: errorMessage);
}

class AssertionException extends AppException {
  final String? errorMessage;
  AssertionException(this.errorMessage)
    : super(
        title: 'Assertion Exception',
        message: errorMessage ?? 'You have an assertion exception',
      );
}

class PlatFormException extends AppException {
  final String? errorMessage;
  PlatFormException(this.errorMessage)
    : super(
        title: 'Platform Exception',
        message: errorMessage ?? 'You have a platform exception',
      );
}

class DataFormatException extends AppException {
  final String? errorMessage;
  DataFormatException(this.errorMessage)
    : super(title: 'Format Exception', message: errorMessage);
}

class ApiTimeOutException extends AppException {
  final String? errorMessage;
  ApiTimeOutException(this.errorMessage)
    : super(
        title: 'TimeOut Exception',
        message: errorMessage,
        // assetPath: Assets.serverTimeOut,
      );
}

class BadRequestException extends AppException {
  BadRequestException([String? message])
    : super(
        title: 'Bad Request',
        message: message ?? 'Your request is invalid.',
      );
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message, String? url])
    : super(title: 'Unauthorized', message: 'Your API key is wrong.');
}

class InvalidDataException extends AppException {
  InvalidDataException([String? message, String? url])
    : super(title: 'Invalid', message: message ?? 'Invalid data');
}

class NotFoundException extends AppException {
  NotFoundException({String? title, String? message})
    : super(
        title: title ?? 'Data Not Found',
        message: message ?? 'No Results Found!',
        // assetPath: Assets.lottieNotFound,
      );
}

class ForbiddenException extends AppException {
  ForbiddenException({String? title, String? message})
    : super(
        title: title ?? 'Forbidden',
        message: message ?? 'You don\t have permission',
        // assetPath: Assets.forbidden,
      );
}

class ServerException extends AppException {
  ServerException({String? title, String? message})
    : super(
        title: title ?? 'Something went wrong on our end!',
        message: message ?? 'We’re working to fix this as quickly as possible.',
        // assetPath: Assets.lottieServerError,
      );
}

class NoResponse extends AppException {
  NoResponse({String? title, String? message})
    : super(
        title: title ?? 'Something went wrong on our end!',
        message: message ?? 'No Response from server',
        // assetPath: Assets.lottieServerError,
      );
}

class FirestoreException extends AppException {
  FirestoreException({
    super.title = 'Firestore error',
    super.message = 'There is something wrong with your request',
  });
}
