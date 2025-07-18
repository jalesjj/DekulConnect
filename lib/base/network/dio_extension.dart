// lib/base/network/dio_extension.dart
import 'package:dio/dio.dart';
import 'package:dekul_connect_app/base/base.dart';

extension DioExtention on Dio {
  Dio addInterceptor(Interceptor interceptor) {
    interceptors.add(interceptor);
    return this;
  }

  Dio addBaseUrl(String baseUrl) {
    options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(minutes: 1),
      receiveTimeout: Duration(minutes: 1),
    );
    return this;
  }

  Future<T> getWith<T>(
    String url,
    Map<String, dynamic>? params,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final response = await get(url, queryParameters: params);
      return fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<T> postWith<T>(
    String url,
    dynamic data,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final response = await post(url, data: data);
      return fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}

extension DioErrorExtention on DioException {
  ErrorResponse? getErrorResponse() {
    try {
      return ErrorResponse.fromJson(response?.data);
    } catch (error) {
      //
    }
    return null;
  }
}
