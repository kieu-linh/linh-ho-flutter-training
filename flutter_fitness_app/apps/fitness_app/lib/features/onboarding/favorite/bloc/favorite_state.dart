import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/utils/status.dart';
import 'package:fitness_app/features/onboarding/favorite/model/favorite.dart';

class FavoriteState extends Equatable {
  const FavoriteState({
    this.fetchFavoriteStatus = SubmissionStatus.initial,
    this.favorites = const [],
    this.errorMessage = '',
  });

  final SubmissionStatus fetchFavoriteStatus;
  final List<Favorite>? favorites;

  final String errorMessage;

  FavoriteState copyWith({
    SubmissionStatus? fetchFavoriteStatus,
    List<Favorite>? favorites,
    String? searchKey,
    String? errorMessage,
  }) {
    return FavoriteState(
      fetchFavoriteStatus: fetchFavoriteStatus ?? this.fetchFavoriteStatus,
      favorites: favorites ?? this.favorites,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        fetchFavoriteStatus,
        favorites,
        errorMessage,
      ];
}
