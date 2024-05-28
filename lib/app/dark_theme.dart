import 'package:flutter/material.dart';

const buttonShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(6)),
);

ThemeData darkTheme(Color seedColor) {
  final lighter = HSLColor.fromColor(seedColor).withLightness(0.75).toColor();
  // final darker = HSLColor.fromColor(seedColor).withLightness(0.35).toColor();
  return ThemeData(
    brightness: Brightness.dark,
    colorSchemeSeed: seedColor,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: lighter,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: Colors.grey.shade900,
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(),
      isDense: true,
      filled: true,
      fillColor: Colors.grey.shade900,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        visualDensity: VisualDensity.comfortable,
        backgroundColor: WidgetStatePropertyAll(seedColor),
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
        shape: const WidgetStatePropertyAll(buttonShape),
        elevation: const WidgetStatePropertyAll(5),
      ),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
        ),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        shape: WidgetStatePropertyAll(buttonShape),
        visualDensity: VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity,
        ),
      ),
    ),
    outlinedButtonTheme: const OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(buttonShape),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(seedColor),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      visualDensity: VisualDensity.compact,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      side: BorderSide(color: seedColor),
    ),
    // appBarTheme: AppBarTheme(
    //   backgroundColor: darker,
    //   surfaceTintColor: Colors.black54,
    //   shadowColor: Colors.black54,
    // ),
  );
}
