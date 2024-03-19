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

class ProfileSubmit extends HomeEvent {
  final String name;
  final double weight;
  final double height;
  final bool gender;
  final int age;

  ProfileSubmit({
    required this.name,
    required this.weight,
    required this.height,
    required this.gender,
    required this.age,
  });
}

class HomeGoalOnTap extends HomeEvent {
  HomeGoalOnTap({this.index = 0});

  final int index;

  @override
  List<Object> get props => [index];
}
