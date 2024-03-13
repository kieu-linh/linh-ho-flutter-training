import 'package:equatable/equatable.dart';

class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class FavoriteFetchData extends FavoriteEvent {}

class FavoriteOnTap extends FavoriteEvent {
  FavoriteOnTap({this.index = 0});

  final int index;

  @override
  List<Object> get props => [index];
}
