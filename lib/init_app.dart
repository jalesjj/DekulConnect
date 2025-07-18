// lib/init_app.dart
import 'package:dekul_connect_app/core/core.dart';
import 'package:dekul_connect_app/init_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dekul_connect_app/base/base.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  initializeDateFormatting('id');
  await SharedPrefs.init();

  // Lock orientation to portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    GetMaterialApp(
      title: "Application",
      initialBinding: InitBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
