import 'package:click_mockup/app/blocs/blocs.dart';
import 'package:click_mockup/features/features.dart';
import 'package:flutter/material.dart';

List<Page<void>> onGenerateAppPages(
  AppStatus status,
  List<Page<dynamic>> pages,
) {
  switch (status) {
    case AppInitial():
      return [LoginPage.page()];
    case AppAuthenticated():
      return [HomePage.page()];
  }
}
