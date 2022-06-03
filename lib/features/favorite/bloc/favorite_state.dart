part of 'favorite_bloc.dart';

class FavoriteState {
  List? favoriteList;

  FavoriteState({this.favoriteList});

  FavoriteState copyWith({List? favoriteList}) {
    return FavoriteState(favoriteList: favoriteList ?? this.favoriteList);
  }
}
