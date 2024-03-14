import 'package:equatable/equatable.dart';

class LevelEvent extends Equatable {
  const LevelEvent();

  @override
  List<Object> get props => [];
}

class LevelFetchData extends LevelEvent {}

class LevelOnTap extends LevelEvent {
  LevelOnTap({this.index = 0});

  final int index;

  @override
  List<Object> get props => [index];
}

