// lib/base/network/interceptor/authorization_header_interceptor.dart
import 'package:dio/dio.dart';

class BearerToken {
  String token;

  BearerToken({required this.token});
}

typedef TokenCallback = Future<BearerToken> Function();

class AuthorizationHeaderInterceptor extends Interceptor {
  TokenCallback onToken;

  AuthorizationHeaderInterceptor({required this.onToken});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    BearerToken token = await onToken();
    bool authorization = true;
    if (options.headers.values.isNotEmpty) {
      options.headers.forEach((key, value) {
        if (key == "Authorization" && value == "disable") {
          authorization = false;
        }
      });
    }

    if (authorization) {
      if (options.headers.entries
          .where((element) => element.key == "Authorization")
          .isEmpty) {
        options.headers.addAll({
          'content-type': 'application/json',
          'Authorization': "Bearer ${token.token}",
        });
      }
    } else {
      options.headers.removeWhere(
        (key, value) => key == "Authorization" && value == "disable",
      );
    }
    super.onRequest(options, handler);
  }
}
