import 'package:bloc/bloc.dart';
import 'package:fitness_app/features/category/bloc/category_event.dart';
import 'package:fitness_app/features/category/bloc/category_state.dart';
import 'package:fitness_app/features/category/repositories/category_repository.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(const CategoryState()) {
    on<CategoryFetchData>(_onFetchCategoryData);
    on<CategorySearch>(_onChangeSearchKey);
  }

  Future _onFetchCategoryData(
    CategoryFetchData event,
    Emitter<CategoryState> emit,
  ) async {
    emit(state.copyWith(
        fetchCategoryStatus: CategoryStatus.onLoadingData, categories: []));
    try {
      final categories = await CategoryRepository().fetchCategory();
      emit(state.copyWith(
          fetchCategoryStatus: CategoryStatus.success, categories: categories));
    } catch (e) {
      emit(state.copyWith(
          fetchCategoryStatus: CategoryStatus.failure,
          errorMessage: e.toString()));
    }
  }

  Future _onChangeSearchKey(
    CategorySearch event,
    Emitter<CategoryState> emit,
  ) async {
    emit(state.copyWith(searchKey: event.searchKey));
  }
}
