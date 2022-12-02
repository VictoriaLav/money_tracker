import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/login_repository.dart';
import '../events/login_event.dart';
import '../states/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(UnAuthenticated()) {
    on<SignInRequested>((event, emit) async {
      emit(Loading());
      try {
        await loginRepository.signIn(
            email: event.email, password: event.password);
        emit(Authenticated());
      } catch (e) {
        emit(LoginError(e.toString()));
        emit(UnAuthenticated());
      }
    });
    on<SignUpRequested>((event, emit) async {
      emit(Loading());
      try {
        await loginRepository.signUp(
            email: event.email, password: event.password);
        emit(Authenticated());
      } catch (e) {
        emit(LoginError(e.toString()));
        emit(UnAuthenticated());
      }
    });
    on<SignOutRequested>((event, emit) async {
      await loginRepository.signOut();
    });
  }
}
