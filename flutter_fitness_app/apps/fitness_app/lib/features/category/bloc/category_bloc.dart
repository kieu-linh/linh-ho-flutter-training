import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/utils/status.dart';
import 'package:fitness_app/features/category/bloc/category_event.dart';
import 'package:fitness_app/features/category/bloc/category_state.dart';
import 'package:fitness_app/features/category/repository/category_repository.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(this.repository) : super(const CategoryState()) {
    on<CategoryFetchData>(_onFetchCategoryData);
    on<CategorySearch>(_onSearch);
  }

  /// This is an instance of the [CategoryRepository] class.
  final CategoryRepository repository;

  /// This function [_onFetchCategoryData] is called when loading the category data.
  Future _onFetchCategoryData(
    CategoryFetchData event,
    Emitter<CategoryState> emit,
  ) async {
    /// emit new state with new values and status loading
    emit(state.copyWith(
        fetchCategoryStatus: SubmissionStatus.loading, categories: []));

    try {
      /// fetch category data from repository
      final categories = await this.repository.fetchCategory();
      emit(
        state.copyWith(
          fetchCategoryStatus: SubmissionStatus.success,
          categories: categories,
        ),
      );
    } catch (e) {
      /// emit new state with new values and status failure
      emit(
        state.copyWith(
          fetchCategoryStatus: SubmissionStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  /// This function [_onSearch] is called when the user searches for a category.
  Future _onSearch(
    CategorySearch event,
    Emitter<CategoryState> emit,
  ) async {
    /// emit new state with new values and search key
    emit(state.copyWith(searchKey: event.searchKey));
  }
}
