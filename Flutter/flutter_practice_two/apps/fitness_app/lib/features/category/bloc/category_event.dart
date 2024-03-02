import 'package:equatable/equatable.dart';

class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class CategoryFetchData extends CategoryEvent {}

class CategorySearch extends CategoryEvent {
  CategorySearch(this.searchKey);

  final String searchKey;

  @override
  List<Object> get props => [searchKey];
}
