import 'package:bloc/bloc.dart';
import 'package:fitness_app/features/category/bloc/category_event.dart';
import 'package:fitness_app/features/category/bloc/category_state.dart';
import 'package:fitness_app/features/category/repositories/category_repository.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(this.repository) : super(const CategoryState()) {
    on<CategoryFetchData>(_onFetchCategoryData);
    on<CategorySearch>(_onSearch);
  }

  final CategoryRepository repository;

  Future _onFetchCategoryData(
    CategoryFetchData event,
    Emitter<CategoryState> emit,
  ) async {
    emit(state
        .copyWith(fetchCategoryStatus: CategoryStatus.loading, categories: []));
    try {
      final categories = await this.repository.fetchCategory();
      emit(state.copyWith(
          fetchCategoryStatus: CategoryStatus.success, categories: categories));
    } catch (e) {
      emit(state.copyWith(
          fetchCategoryStatus: CategoryStatus.failure,
          errorMessage: e.toString()));
    }
  }

  Future _onSearch(
    CategorySearch event,
    Emitter<CategoryState> emit,
  ) async {
    emit(state.copyWith(searchKey: event.searchKey));
  }
}
