// lib/styles/text_styles.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dekul_connect_app/styles/styles.dart';

class BiryaniTextStyles {
  static TextStyle _style() {
    return GoogleFonts.biryani();
  }

  static final normal = _style().copyWith(
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    height: 0,
  );

  static final bold = _style().copyWith(
    color: AppColors.black,
    fontWeight: FontWeight.w800,
    height: 0,
  );
}
