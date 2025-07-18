// lib/core/middleware/auth_middleware.dart
import 'package:dekul_connect_app/base/base.dart';
import 'package:dekul_connect_app/core/core.dart';
import 'package:dekul_connect_app/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    var hasAuth =
        SharedPrefs.getString(SessionConstant.token)?.isNotEmpty ?? false;

    if (hasAuth) {
      return RouteSettings(name: Routes.HOME);
    }

    return super.redirect(route);
  }
}
