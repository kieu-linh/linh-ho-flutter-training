import 'package:equatable/equatable.dart';
import 'package:fitness_app/features/home/model/goal.dart';

enum HomePageStatus {
  initial,
  inProgress,
  onLoadingData,
  onFetchGoalData,
  onFetchCategoryData,
  success,
  failure,
  canceled,
  error
}

class HomeState extends Equatable {
  const HomeState({
    this.status = HomePageStatus.initial,
    this.goals,
    this.errorMessage = '',
  });

  final HomePageStatus status;
  final List<Goal>? goals;
  final String errorMessage;

  HomeState copyWith({
    HomePageStatus? status,
    List<Goal>? goals,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      goals: goals ?? this.goals,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        goals,
        errorMessage,
      ];
}
