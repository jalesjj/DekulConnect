// lib/base/network/interceptor/error_json_api_response_interceptor.dart
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:dekul_connect_app/base/base.dart';
import 'dart:io';

import 'package:dekul_connect_app/resources/resources.dart';

class ErrorJsonApiResponseInterceptor extends Interceptor {
  final Function(DioException) onUnauthorized;
  final Function(DioException) onErrorException;

  ErrorJsonApiResponseInterceptor({
    required this.onUnauthorized,
    required this.onErrorException,
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.badResponse) {
      DioException newError = getDioErrorMessageResponseTypeOnly(err);
      if (err.response?.statusCode == 401) {
        onUnauthorized(newError);
      } else {
        onErrorException(newError);
      }
    } else {
      onErrorException(getMessageExceptResponseType(err));
    }

    super.onError(err, handler);
  }
}

DioException getMessageExceptResponseType(DioException error) {
  String? newMessage;
  switch (error.type) {
    case DioExceptionType.cancel:
      newMessage = NetworkMessageContants.genericErrorCancel.tr;
      break;
    case DioExceptionType.connectionTimeout:
      newMessage = NetworkMessageContants.genericErrorConnectTimeout.tr;
      break;
    case DioExceptionType.unknown:
      newMessage = NetworkMessageContants.genericErrorNetwork.tr;
      break;
    case DioExceptionType.receiveTimeout:
      newMessage = NetworkMessageContants.genericErrorReceiveTimeout.tr;
      break;
    case DioExceptionType.sendTimeout:
      newMessage = NetworkMessageContants.genericErrorSendTimeout.tr;
      break;
    case DioExceptionType.badResponse ||
        DioExceptionType.badCertificate ||
        DioExceptionType.connectionError:
      break;
  }
  return DioException(
    requestOptions: error.requestOptions,
    response: error.response,
    error: newMessage,
  );
}

DioException getDioErrorMessageResponseTypeOnly(DioException error) {
  String? newMessage;
  if (error.response?.statusCode == -1 ||
      error.response?.statusCode != HttpStatus.serviceUnavailable) {
    try {
      ErrorResponse errorResponse = ErrorResponse.fromJson(
        error.response?.data,
      );
      newMessage = errorResponse.message;
    } catch (e) {
      newMessage =
          '${NetworkMessageContants.genericError.tr} ${NetworkMessageContants.genericErrorBody.tr}';
    }
  } else if (error.response?.statusCode == HttpStatus.serviceUnavailable) {
    newMessage = NetworkMessageContants.genericErrorService.tr;
  }
  return DioException(
    requestOptions: error.requestOptions,
    response: error.response,
    error: newMessage,
  );
}
