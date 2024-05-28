import 'package:click_mockup/app/blocs/blocs.dart';
import 'package:click_mockup/features/features.dart';
import 'package:flutter/material.dart';

List<Page<void>> onGenerateAppPages(
  AuthState state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AuthInitial():
    case AuthUnauthenticated():
      return [LoginPage.page()];
    case AuthAuthenticated():
      return [HomePage.page()];
  }
}
