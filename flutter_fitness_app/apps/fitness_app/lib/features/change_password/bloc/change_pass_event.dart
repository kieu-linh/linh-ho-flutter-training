import 'package:equatable/equatable.dart';

abstract class ChangePassEvent extends Equatable {
  const ChangePassEvent();

  @override
  List<Object?> get props => [];
}

/// The [ChangePassSubmitted] is used to notify
/// when the User pressed the LoginButton.
class ChangePassSubmitted extends ChangePassEvent {
  const ChangePassSubmitted({
    this.currentPassword = '',
    this.newPassword = '',
  });

  final String currentPassword;
  final String newPassword;

  @override
  List<Object> get props => [currentPassword, newPassword];
}

/// The [CurrentPassChanged] is used to notify
/// when the User input the currentPassword field.
class CurrentPassChanged extends ChangePassEvent {
  const CurrentPassChanged({this.currentPassword = ''});

  final String currentPassword;

  @override
  List<Object> get props => [currentPassword];
}

/// The [NewPassChanged] is used to notify
/// when the User input the newPassword field.
class NewPassChanged extends ChangePassEvent {
  const NewPassChanged({
    this.newPassword = '',
  });

  final String newPassword;

  @override
  List<Object> get props => [newPassword];
}

/// The [ConfirmPasswordChanged] is used to notify
/// when the User input the confirm password field.
class ConfirmPasswordChanged extends ChangePassEvent {
  const ConfirmPasswordChanged({this.confirmPassword = ''});

  final String confirmPassword;

  @override
  List<Object> get props => [confirmPassword];
}