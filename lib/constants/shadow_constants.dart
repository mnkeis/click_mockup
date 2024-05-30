import 'package:flutter/material.dart';

class ShadowConstants {
  static List<BoxShadow> black10 = [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      offset: const Offset(0, 1),
      blurRadius: 8,
      spreadRadius: 0.2,
    ),
  ];
}
