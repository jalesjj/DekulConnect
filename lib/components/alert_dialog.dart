// lib/components/alert_dialog.dart
import 'package:dekul_connect_app/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> showAlertDialog({
  String? title,
  String? content,
  bool barrierDismissible = true,
}) async {
  await showCupertinoDialog(
    context: Get.context!,
    barrierDismissible: barrierDismissible,
    builder:
        (context) => AlertDialog(
          scrollable: true,
          backgroundColor: AppColors.white,
          title: Text(
            title ?? "Terjadi Kesalahan",
            style: BiryaniTextStyles.bold.copyWith(fontSize: 12),
          ),
          content: Text(
            content ?? 'Error',
            style: BiryaniTextStyles.normal.copyWith(fontSize: 14),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: Get.back,
              child: Text(
                'OK',
                style: BiryaniTextStyles.normal.copyWith(fontSize: 14),
              ),
            ),
          ],
        ),
  );
}
