// lib/styles/border_radiuses.dart
import 'package:flutter/material.dart';

class BorderRadiuses {
  const BorderRadiuses();

  static BorderRadius get circular => BorderRadius.circular(999);

  static BorderRadius get circular6 => BorderRadius.circular(6);

  static BorderRadius get circular8 => BorderRadius.circular(8);

  static BorderRadius get circular10 => BorderRadius.circular(10);

  static BorderRadius get circular12 => BorderRadius.circular(12);

  static BorderRadius get circular16 => BorderRadius.circular(16);

  static BorderRadius get circular18 => BorderRadius.circular(18);

  static BorderRadius get circular24 => BorderRadius.circular(24);

  static BorderRadius get topLR4 => BorderRadius.only(
    topLeft: Radius.circular(4),
    topRight: Radius.circular(4),
  );

  static BorderRadius get topLR10 => BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(10),
  );

  static BorderRadius get topLR24 => BorderRadius.only(
    topLeft: Radius.circular(24),
    topRight: Radius.circular(24),
  );

  static BorderRadius get botLR24 => BorderRadius.only(
    bottomLeft: Radius.circular(24),
    bottomRight: Radius.circular(24),
  );
}
