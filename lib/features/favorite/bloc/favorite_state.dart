part of 'favorite_bloc.dart';

class FavoriteState {
  List? favoriteUrlList;

  FavoriteState({this.favoriteUrlList});

  FavoriteState copyWith({List? favoriteUrlList}) {
    return FavoriteState(favoriteUrlList: favoriteUrlList ?? this.favoriteUrlList);
  }
}
