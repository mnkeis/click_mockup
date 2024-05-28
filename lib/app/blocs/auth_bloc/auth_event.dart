part of 'auth_bloc.dart';

sealed class AuthEvent {}

class Authenticate extends AuthEvent {}

class Logout extends AuthEvent {}
