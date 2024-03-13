import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/utils/status.dart';
import 'package:fitness_app/features/onboarding/favorite/bloc/favorite_event.dart';
import 'package:fitness_app/features/onboarding/favorite/bloc/favorite_state.dart';
import 'package:fitness_app/features/onboarding/favorite/repository/favorite_repository.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc(this.repository) : super(const FavoriteState()) {
    on<FavoriteFetchData>(_onFetchFavoriteData);
    on<FavoriteOnTap>(_onFavoriteOnTap);
  }

  /// This is an instance of the [FavoriteRepository] class.
  final FavoriteRepository repository;

  /// This function [_onFetchFavoriteData] is called when loading the favorite data.
  Future _onFetchFavoriteData(
    FavoriteFetchData event,
    Emitter<FavoriteState> emit,
  ) async {
    /// emit new state with new values and status loading
    emit(state.copyWith(
        fetchFavoriteStatus: SubmissionStatus.loading, favorites: []));
    try {
      /// fetch favorite data from repository
      final favorites = await this.repository.fetchFavorite();

      emit(
        state.copyWith(
          fetchFavoriteStatus: SubmissionStatus.success,
          favorites: favorites,
        ),
      );
    } catch (e) {
      /// emit new state with new values and status failure
      emit(
        state.copyWith(
          fetchFavoriteStatus: SubmissionStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  /// This function [_onFavoriteOnTap] is called when the user taps on a favorite.
  Future _onFavoriteOnTap(
    FavoriteOnTap event,
    Emitter<FavoriteState> emit,
  ) async {
    /// emit new state with new values and index
    emit(state.copyWith(index: event.index));
  }
}
