import 'package:bloc/bloc.dart';

part 'app_events.dart';
part 'app_status.dart';

class AppBloc extends Bloc<AppEvents, AppStatus> {
  AppBloc() : super(AppInitial()) {
    on<Authenticate>((event, emiter) {
      emiter(AppAuthenticated());
    });
  }
}
