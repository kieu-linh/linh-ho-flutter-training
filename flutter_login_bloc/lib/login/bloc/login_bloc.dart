import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_ex/data/authentication/authentication.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }
  final AuthenticationRepository _authenticationRepository;

  void _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: LoginStatus.loading));
    final login = await _authenticationRepository.logIn(
      email: event.email,
      password: event.password,
    );
    print('[Log] $login');
    if (login == AuthenticationStatus.authenticated) {
      emit(state.copyWith(status: LoginStatus.success));
    } else {
      emit(state.copyWith(status: LoginStatus.failure));
    }
  }
}
