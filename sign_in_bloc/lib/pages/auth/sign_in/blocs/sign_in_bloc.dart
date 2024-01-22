import 'package:api_client/api_client.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_bloc/pages/auth/auth_validator.dart';
import 'package:sign_in_bloc/pages/auth/sign_in/blocs/sign_in_event.dart';
import 'package:sign_in_bloc/pages/auth/sign_in/blocs/sign_in_state.dart';
import 'package:sign_in_bloc/pages/auth/sign_in/responsitories/auth_responsitory.dart';



class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.repository,
  }) : super(
          const SignInInitialState(
            authViewModel: AuthViewModel(),
          ),
        ) {
    on<SignInUsernameChangedEvent>(_onUsernameChanged);
    on<SignInPasswordChangedEvent>(_onPasswordChanged);
    on<SignInRequestedEvent>(_onSubmitted);
    on<SignOutRequestedEvent>(_onSignOutRequest);
  }

  final AuthRepository repository;

  Future<void> _onUsernameChanged(
    SignInUsernameChangedEvent event,
    Emitter<AuthState> emit,
  ) async {
    /// This code is called when the value of the
    /// username formfield on the sign in screen changes.
    emit(
      SignInValueChangedLoadingState(
        authViewModel: state.authViewModel.copyWith(
          signInStatus: SignInStatus.onUsernameChangedLoading,
        ),
      ),
    );

    /// It checks to see if the username is valid.
    /// If it is, it emits a [SignInValueChangedSuccessState],
    /// otherwise it emits a [SignInValueChangedFailureState].
    final value = event.username;
    final isValidUsername = FAValidator.validatorEmail(value);

    if (isValidUsername == null) {
      emit(
        SignInValueChangedSuccessState(
          authViewModel: state.authViewModel.copyWith(
            signInStatus: SignInStatus.onUsernameChangedSuccess,
            username: value,
            isUsernameValid: true,
          ),
        ),
      );
    } else {
      emit(
        SignInValueChangedFailureState(
          authViewModel: state.authViewModel.copyWith(
            signInStatus: SignInStatus.onUsernameChangedFailure,
            username: value ?? '',
          ),
        ),
      );
    }
  }

  Future<void> _onPasswordChanged(
    SignInPasswordChangedEvent event,
    Emitter<AuthState> emit,
  ) async {
    /// This code is called when the value of the
    /// password formfield on the sign in screen changes.
    emit(
      SignInValueChangedLoadingState(
        authViewModel: state.authViewModel.copyWith(
          signInStatus: SignInStatus.onPasswordChangedLoading,
        ),
      ),
    );

    /// It checks to see if the password is valid.
    /// If it is, it emits a [SignInValueChangedSuccessState],
    /// otherwise it emits a [SignInValueChangedFailureState].
    final value = event.password;
    final isValidPassword = FAValidator.validatorEmail(value);

    if (isValidPassword == null) {
      emit(
        SignInValueChangedSuccessState(
          authViewModel: state.authViewModel.copyWith(
            signInStatus: SignInStatus.onPasswordChangedSuccess,
            password: value ?? '',
            isPasswordValid: true,
          ),
        ),
      );
    } else {
      emit(
        SignInValueChangedFailureState(
          authViewModel: state.authViewModel.copyWith(
            signInStatus: SignInStatus.onPasswordChangedFailure,
            password: value ?? '',
          ),
        ),
      );
    }
  }

  Future<void> _onSubmitted(
    SignInRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    // This code is called when the user pressed the sign in button.
    // The sign in button will enable or disable based on state
    emit(
      SignInLoadingState(
        authViewModel: state.authViewModel.copyWith(
          signInStatus: SignInStatus.onValueChangedSuccess,
        ),
      ),
    );
    // call the signIn method on the repository to execute SignIn logic.
    try {
      final userResponse = await repository.signIn(
        username: event.username,
        password: event.password,
      );

      // If the user is verified, emit a [AuthenticatedState],
      if (userResponse.userVerified) {
        emit(
          AuthenticatedState(
            authViewModel: state.authViewModel.copyWith(
              signInStatus: SignInStatus.success,
              authStatus: AuthStatus.authenticated,
            ),
          ),
        );
      } else {
        // otherwise emit a [SignInFailureState]
        emit(
          SignInFailureState(
            authViewModel: state.authViewModel.copyWith(
              signInStatus: SignInStatus.failure,
            ),
          ),
        );
      }
    } catch (error) {
      // If an error occurs, emit a [SignInFailureState] with an error message.
      emit(
        SignInFailureState(
          authViewModel: state.authViewModel.copyWith(
            signInStatus: SignInStatus.failure,
            errorMessage: ErrorHandler.handle(error).failure.message,
          ),
        ),
      );
    }
  }

  Future<void> _onSignOutRequest(
    SignOutRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    // This code is called when the user pressed the sign out button.
    emit(
      SignOutLoadingState(
        authViewModel: state.authViewModel.copyWith(),
      ),
    );
    try {
      // call the signOut method on the repository to execute SignOut logic.
      await repository.signOut();
      // If the user is signed out, emit a [UnAuthenticatedState],
      emit(
        UnAuthenticatedState(
          authViewModel: state.authViewModel.copyWith(
            signInStatus: SignInStatus.initial,
            authStatus: AuthStatus.unauthenticated,
          ),
        ),
      );
    } catch (error) {
      // If an error occurs, emit a [SignInFailureState] with an error message.
      emit(
        SignInFailureState(
          authViewModel: state.authViewModel.copyWith(
            signInStatus: SignInStatus.failure,
            errorMessage: ErrorHandler.handle(error).failure.message,
          ),
        ),
      );
    }
  }
}
