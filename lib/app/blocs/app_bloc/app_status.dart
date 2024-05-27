part of 'app_bloc.dart';

sealed class AppStatus {}

class AppInitial extends AppStatus {}

class AppAuthenticated extends AppStatus {}
