part of 'favorite_bloc.dart';

abstract class FavoriteEvent {}

class AddFavoriteEvent extends FavoriteEvent {
  final dynamic element;
  AddFavoriteEvent(this.element);
}

class RemoveFavoriteEvent extends FavoriteEvent {
  final dynamic element;
  RemoveFavoriteEvent(this.element);
}

class PutAtTopFavoriteEvent extends FavoriteEvent {
  final dynamic element;
  PutAtTopFavoriteEvent(this.element);
}
