import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_ex/data/authentication/authentication.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const AuthenticationUnknown()) {
    on<AuthenticationStarted>(_onAuthenticationStarted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onAuthenticationStarted(
    AuthenticationStarted event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const AuthenticationUnknown());

    final auth = await _authenticationRepository.logIn(
        email: 'emailasass', password: 'password');
    if (auth == AuthenticationStatus.authenticated) {
      emit(const AuthenticationAuthenticated());
    } else {
      emit(const AuthenticationUnauthenticated());
    }
  }
}
