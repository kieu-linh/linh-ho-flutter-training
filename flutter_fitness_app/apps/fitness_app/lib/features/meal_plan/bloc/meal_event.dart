import 'package:equatable/equatable.dart';

abstract class MealEvent extends Equatable {
  const MealEvent();

  @override
  List<Object> get props => [];
}

class FetchMealData extends MealEvent {}

class FetchMealDetailData extends MealEvent {}

class MealOnTap extends MealEvent {
  MealOnTap({this.index = 1});

  final int index;

  @override
  List<Object> get props => [index];
}
