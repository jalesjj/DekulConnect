// lib/base/routes/app_routes.dart
// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const LOGIN = _Paths.LOGIN;
  static const HOME = _Paths.HOME;
  static const AKTIVITAS = _Paths.HOME + _Paths.AKTIVITAS;
  static const INPUT_AKTIVITAS = _Paths.HOME + _Paths.INPUT_AKTIVITAS;
  static const NILAI = _Paths.HOME + _Paths.NILAI;
  static const INPUT_NILAI = _Paths.HOME + _Paths.INPUT_NILAI;
}

abstract class _Paths {
  _Paths._();
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const AKTIVITAS = '/aktivitas';
  static const INPUT_AKTIVITAS = '/input-aktivitas';
  static const NILAI = '/nilai';
  static const INPUT_NILAI = '/input-nilai';
}
