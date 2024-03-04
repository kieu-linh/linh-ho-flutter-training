import 'package:equatable/equatable.dart';
import 'package:fitness_app/features/home/model/category.dart';

enum CategoryStatus {
  initial,
  loading,
  success,
  failure,
}

class CategoryState extends Equatable {
  const CategoryState({
    this.fetchCategoryStatus = CategoryStatus.initial,
    this.categories = const [],
    this.searchKey = '',
    this.errorMessage = '',
  });

  final CategoryStatus fetchCategoryStatus;
  final List<Category>? categories;
  final String? searchKey;

  final String errorMessage;

  CategoryState copyWith({
    CategoryStatus? fetchCategoryStatus,
    List<Category>? categories,
    String? searchKey,
    String? errorMessage,
  }) {
    return CategoryState(
      fetchCategoryStatus: fetchCategoryStatus ?? this.fetchCategoryStatus,
      categories: categories ?? this.categories,
      searchKey: searchKey ?? this.searchKey,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        fetchCategoryStatus,
        categories,
        searchKey,
        errorMessage,
      ];
}
