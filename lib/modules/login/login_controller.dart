import 'dart:developer';

import 'package:dekul_connect_app/base/base.dart';
import 'package:dekul_connect_app/components/components.dart';
import 'package:dekul_connect_app/core/core.dart';
import 'package:dekul_connect_app/data/data.dart';
import 'package:dekul_connect_app/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends BaseViewModel {
  final _authenticationServices = Get.find<AuthenticationServices>();

  final selectedRole = Rx<RoleEnums?>(null);

  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    log("LoginController on Init");
  }

  void onRoleChanged(RoleEnums? role) {
    usernameTextController.text = "081...";
    passwordTextController.text = "";
    selectedRole.value = role;
    update();
  }

  Future<void> performLogin() async {
    showLoadingContainer();
    await login();
    hideLoadingContainer();
  }

  Future<void> login() async {
    try {
      final result = await _authenticationServices.login(
        Login(
          phone: usernameTextController.text,
          password: passwordTextController.text,
        ),
      );
      RoleEnums? userRole = RoleEnums.fromString(result.data?.user?.role ?? "");
      if (userRole == selectedRole.value) {
        await SharedPrefs.setString(
          SessionConstant.token,
          result.data?.token ?? "",
        );
        Get.offAllNamed(Routes.HOME);
      } else {
        showAlertDialog(content: "Akun tidak ditemukan");
      }
    } catch (e) {
      logger.e(e);
    }
  }
}
