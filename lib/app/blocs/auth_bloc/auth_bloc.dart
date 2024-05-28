import 'package:bloc/bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>(_onEvent);
  }

  void _onEvent(AuthEvent event, Emitter<AuthState> emiter) {
    switch (event) {
      case Authenticate():
        emiter(AuthAuthenticated());
      case Logout():
        emiter(AuthUnauthenticated());
    }
  }
}
