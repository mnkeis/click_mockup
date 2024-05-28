import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeModeCubit extends Cubit<ThemeMode> {
  ThemeModeCubit() : super(ThemeMode.system);

  // ignore: avoid_positional_boolean_parameters
  void darkMode(bool mode) {
    emit(mode ? ThemeMode.dark : ThemeMode.light);
  }
}
