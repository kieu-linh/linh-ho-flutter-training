import 'package:equatable/equatable.dart';

class GoalEvent extends Equatable {
  const GoalEvent();

  @override
  List<Object> get props => [];
}

class GoalFetchData extends GoalEvent {}

class GoalOnTap extends GoalEvent {
  GoalOnTap({this.index = 0});

  final int index;

  @override
  List<Object> get props => [index];
}

