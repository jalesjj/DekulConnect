// lib/styles/borders.dart
import 'package:dekul_connect_app/styles/styles.dart';
import 'package:flutter/material.dart';

class Borders {
  const Borders();

  static BorderSide get grey1px =>
      BorderSide(width: 1, color: AppColors.black.withValues(alpha: 0.1));
  static BorderSide get red1px => BorderSide(width: 1, color: AppColors.red);

  static OutlineInputBorder get textFieldBorder => OutlineInputBorder(
    borderRadius: BorderRadiuses.circular24,
    borderSide: grey1px,
  );

  static OutlineInputBorder get textFieldFocusedBorder => OutlineInputBorder(
    borderRadius: BorderRadiuses.circular24,
    borderSide: grey1px,
  );

  static OutlineInputBorder get textFieldErrorBorder => OutlineInputBorder(
    borderRadius: BorderRadiuses.circular24,
    borderSide: red1px,
  );

  static OutlineInputBorder get textFieldDisabledBorder => OutlineInputBorder(
    borderRadius: BorderRadiuses.circular24,
    borderSide: grey1px,
  );

  static OutlineInputBorder get textFieldSearchBorder => OutlineInputBorder(
    borderRadius: BorderRadiuses.circular,
    borderSide: grey1px,
  );

  static OutlineInputBorder get textFieldSearchFocusedBorder =>
      OutlineInputBorder(
        borderRadius: BorderRadiuses.circular,
        borderSide: grey1px,
      );

  static OutlineInputBorder get textFieldSearchErrorBorder =>
      OutlineInputBorder(
        borderRadius: BorderRadiuses.circular,
        borderSide: red1px,
      );

  static OutlineInputBorder get textFieldSearchDisabledBorder =>
      OutlineInputBorder(
        borderRadius: BorderRadiuses.circular,
        borderSide: grey1px,
      );
}
