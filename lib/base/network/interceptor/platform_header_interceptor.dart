// lib/base/network/interceptor/platform_header_interceptor.dart
import 'package:dio/dio.dart';

class PlatformHeaderInterceptor extends Interceptor {
  PlatformHeaderInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      'content-type': 'application/json',
      'x-platform': 'apps',
    });
    super.onRequest(options, handler);
  }
}
