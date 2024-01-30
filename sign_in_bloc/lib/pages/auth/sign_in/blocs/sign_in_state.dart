
import 'package:equatable/equatable.dart';

enum SignInStatus {
  initial,
  inProgress,
  onValueChangedLoading,
  onValueChangedSuccess,
  onValueChangedFailure,
  onUsernameChangedLoading,
  onUsernameChangedSuccess,
  onUsernameChangedFailure,
  onPasswordChangedLoading,
  onPasswordChangedSuccess,
  onPasswordChangedFailure,
  success,
  failure,
  canceled,
}

enum AuthStatus {
  unauthenticated,
  authenticated,
}

// The AuthState is used to notify the UI of the current authentication state.

abstract class AuthState extends Equatable {
  const AuthState({required this.authViewModel});

  final AuthViewModel authViewModel;

  @override
  List<Object> get props => [authViewModel];
}

// The initial state of the SignInViewModel.
class SignInInitialState extends AuthState {
  const SignInInitialState({required super.authViewModel});

  SignInInitialState copyWith({AuthViewModel? authViewModel}) {
    return SignInInitialState(
      authViewModel: authViewModel ?? this.authViewModel,
    );
  }

  @override
  List<Object> get props => [];
}

// Creating a loading state for the sign-in page.

class SignInLoadingState extends AuthState {
  const SignInLoadingState({required super.authViewModel});

  SignInLoadingState copyWith({AuthViewModel? authViewModel}) {
    return SignInLoadingState(
      authViewModel: authViewModel ?? this.authViewModel,
    );
  }

  @override
  List<Object> get props => [];
}

// Creating a state for when the user changes their username or password.
class SignInValueChangedLoadingState extends AuthState {
  const SignInValueChangedLoadingState({required super.authViewModel});

  SignInValueChangedLoadingState copyWith({
    AuthViewModel? authViewModel,
  }) {
    return SignInValueChangedLoadingState(
      authViewModel: authViewModel ?? this.authViewModel,
    );
  }

  @override
  List<Object> get props => [];
}

// Creating a state for when both username and password pass the validator.
class SignInValueChangedSuccessState extends AuthState {
  const SignInValueChangedSuccessState({required super.authViewModel});

  SignInValueChangedSuccessState copyWith({AuthViewModel? authViewModel}) {
    return SignInValueChangedSuccessState(
      authViewModel: authViewModel ?? this.authViewModel,
    );
  }

  @override
  List<Object> get props => [];
}

// Creating a state for when one of username or password not pass the validator.
class SignInValueChangedFailureState extends AuthState {
  const SignInValueChangedFailureState({required super.authViewModel});

  SignInValueChangedFailureState copyWith({AuthViewModel? authViewModel}) {
    return SignInValueChangedFailureState(
      authViewModel: authViewModel ?? this.authViewModel,
    );
  }

  @override
  List<Object> get props => [];
}

// Creating a state for when there is any error.
class SignInFailureState extends AuthState {
  const SignInFailureState({required super.authViewModel});

  SignInFailureState copyWith({AuthViewModel? authViewModel}) {
    return SignInFailureState(
      authViewModel: authViewModel ?? this.authViewModel,
    );
  }

  @override
  List<Object> get props => [];
}

/// Creating a state for when the user successfully signs in,
/// used for global app.
class AuthenticatedState extends AuthState {
  const AuthenticatedState({required super.authViewModel});

  AuthenticatedState copyWith({AuthViewModel? authViewModel}) {
    return AuthenticatedState(
      authViewModel: authViewModel ?? this.authViewModel,
    );
  }

  @override
  List<Object> get props => [];
}

/// Creating a state for when the user successfully signs out,
/// or initial app,
/// used for global app.
class UnAuthenticatedState extends AuthState {
  const UnAuthenticatedState({required super.authViewModel});

  UnAuthenticatedState copyWith({AuthViewModel? authViewModel}) {
    return UnAuthenticatedState(
      authViewModel: authViewModel ?? this.authViewModel,
    );
  }

  @override
  List<Object> get props => [];
}

/// Displaying the loading state when a user signs out.
class SignOutLoadingState extends AuthState {
  const SignOutLoadingState({required super.authViewModel});

  SignOutLoadingState copyWith({AuthViewModel? authViewModel}) {
    return SignOutLoadingState(
      authViewModel: authViewModel ?? this.authViewModel,
    );
  }

  @override
  List<Object> get props => [];
}

/// A view model for the authentication
class AuthViewModel extends Equatable {
  const AuthViewModel({
    this.authStatus = AuthStatus.unauthenticated,
    this.signInStatus = SignInStatus.initial,
    this.username = '',
    this.password = '',
    this.isUsernameValid = false,
    this.isPasswordValid = false,
    this.errorMessage = '',
  });

  // Get the current auth status
  final AuthStatus? authStatus;

  // Get the current sign in status
  final SignInStatus signInStatus;

  // Get the current username and password
  final String? username;
  final String? password;

  // Get whether the username and password are valid
  final bool isUsernameValid;
  final bool isPasswordValid;

  // Get the current error message
  final String errorMessage;

  AuthViewModel copyWith({
    AuthStatus? authStatus,
    SignInStatus? signInStatus,
    String? username,
    String? password,
    bool? isUsernameValid,
    bool? isPasswordValid,
    String? errorMessage,
  }) {
    return AuthViewModel(
      authStatus: authStatus ?? this.authStatus,
      signInStatus: signInStatus ?? this.signInStatus,
      username: username ?? this.username,
      password: password ?? this.password,
      isUsernameValid: isUsernameValid ?? this.isUsernameValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        authStatus,
        signInStatus,
        username,
        password,
        isUsernameValid,
        isPasswordValid,
        errorMessage,
      ];
}
