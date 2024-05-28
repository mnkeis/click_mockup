import 'package:flutter/material.dart';

const buttonShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(6)),
);

ThemeData theme(Color seedColor) {
  final darker = HSLColor.fromColor(seedColor).withLightness(0.45).toColor();
  return ThemeData(
    colorSchemeSeed: seedColor,

    scaffoldBackgroundColor: Colors.grey.shade200,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: darker,
        fontWeight: FontWeight.bold,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade400,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: darker),
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      isDense: true,
      filled: true,
      fillColor: Colors.grey.shade200,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        visualDensity: VisualDensity.comfortable,
        backgroundColor: WidgetStatePropertyAll(seedColor),
        shape: const WidgetStatePropertyAll(buttonShape),
        elevation: const WidgetStatePropertyAll(5),
      ),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
        ),
        foregroundColor: WidgetStatePropertyAll(Colors.black),
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
    //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    // ),
  );
}
