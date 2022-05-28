part of 'favorite_bloc.dart';

abstract class FavoriteEvent {}

class AddFavoriteEvent extends FavoriteEvent {
  final dynamic element;
  AddFavoriteEvent(this.element);
}
