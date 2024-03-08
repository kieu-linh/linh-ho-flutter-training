import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeEvent {}

class HomeFetchGoalData extends HomeEvent {}

class HomeFetchCategoryData extends HomeEvent {}

class HomeFetchMealData extends HomeEvent {}

class HomeFetchPopularExerciseData extends HomeEvent {}

class HomeFetchAddExerciseData extends HomeEvent {}

class HomeFetchUserData extends HomeEvent {}

class HomeGoalOnTap extends HomeEvent {
  HomeGoalOnTap({this.index = 0});

  final int index;

  @override
  List<Object> get props => [index];
}
