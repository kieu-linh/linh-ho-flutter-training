import 'package:equatable/equatable.dart';

class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class CategoryFetchData extends CategoryEvent {}

/// The [CategorySearch] is used to notify when the user searches for a category.
class CategorySearch extends CategoryEvent {
  CategorySearch(this.searchKey);

  final String searchKey;

  @override
  List<Object> get props => [searchKey];
}
