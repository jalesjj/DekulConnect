// lib/base/routes/app_pages.dart
// ignore_for_file: constant_identifier_names

import 'package:dekul_connect_app/core/core.dart';
import 'package:get/get.dart';
import 'package:dekul_connect_app/modules/modules.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.AKTIVITAS,
          page: () => const AktivitasView(),
          binding: AktivitasBinding(),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: _Paths.INPUT_AKTIVITAS,
          page: () => const InputAktivitasView(),
          binding: InputAktivitasBinding(),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: _Paths.NILAI,
          page: () => const NilaiView(),
          binding: NilaiBinding(),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: _Paths.INPUT_NILAI,
          page: () => const InputNilaiView(),
          binding: InputNilaiBinding(),
          transition: Transition.cupertino,
        ),
      ],
    ),
  ];
}
