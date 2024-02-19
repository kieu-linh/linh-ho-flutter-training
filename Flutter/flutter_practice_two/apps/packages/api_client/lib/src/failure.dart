import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  const Failure(this.code, this.message);

  final String message;
  final String code;

  @override
  List<Object?> get props => [code, message];
}
