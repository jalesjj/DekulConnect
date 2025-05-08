import 'package:dekul_connect_app/core/core.dart';
import 'package:dekul_connect_app/data/data.dart';
import 'package:dekul_connect_app/gen/assets.gen.dart';
import 'package:dekul_connect_app/modules/modules.dart';
import 'package:flutter/material.dart';

import 'package:dekul_connect_app/components/components.dart';
import 'package:dekul_connect_app/styles/styles.dart';

class LoginView extends BaseView<LoginController> {
  const LoginView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;

  @override
  Widget body(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child:
          controller.selectedRole.value != null
              ? _loginRender()
              : _selectMenuRender(),
    );
  }

  Widget _selectMenuRender() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            "Selamat Datang\nKembali !",
            style: BiryaniTextStyles.bold.copyWith(
              fontSize: 24,
              color: AppColors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 60),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 48),
          decoration: BoxDecoration(
            color: AppColors.lightBlue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            spacing: 12,
            children: [
              _buttonSelectRender(RoleEnums.ortu),
              _buttonSelectRender(RoleEnums.guru),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buttonSelectRender(RoleEnums role) {
    return GestureDetector(
      onTap: () {
        controller.onRoleChanged(role);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.white),
        ),
        child: Column(
          children: [
            (role == RoleEnums.guru
                    ? Assets.images.selectGuru
                    : Assets.images.selectOrtu)
                .image(width: 72, height: 72),
            SizedBox(height: 12),
            Text(
              "Login Sebagai\n${role == RoleEnums.guru ? "Guru" : "Orang Tua"}",
              style: BiryaniTextStyles.bold.copyWith(
                fontSize: 12,
                color: AppColors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginRender() {
    final role = controller.selectedRole.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (role == RoleEnums.guru
                ? Assets.images.logoGuru
                : Assets.images.logoOrtu)
            .image(width: 256, height: 256),
        const SizedBox(height: 30),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            spacing: 12,
            children: [
              BaseTextField(
                hintText: "Username",
                controller: controller.usernameTextController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  child: Assets.icons.icUser.svg(width: 24, height: 24),
                ),
              ),
              BaseTextField(
                hintText: "Password",
                controller: controller.passwordTextController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  child: Assets.icons.icLock.svg(width: 24, height: 24),
                ),
                isObscure: true,
              ),
              ButtonRender(
                title: "Login",
                backgroundColor: AppColors.darkBlue,
                borderColor: AppColors.white,
                onTap: controller.performLogin,
              ),
              ButtonRender(
                title: "Kembali ke Opsi",
                backgroundColor: AppColors.blue,
                borderColor: AppColors.blue,
                onTap: () => {controller.onRoleChanged(null)},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
