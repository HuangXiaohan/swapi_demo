import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteState()) {
    on<AddFavoriteEvent>(_addFavorite);
    on<RemoveFavoriteEvent>(_removeFavorite);
  }

  void _addFavorite(AddFavoriteEvent event, Emitter emitter) {
    var newList = state.favoriteUrlList ?? [];
    newList.add(event.element);
    emitter(state.copyWith(favoriteUrlList: newList));
  }

  void _removeFavorite(RemoveFavoriteEvent event, Emitter emitter) {
    var newList = state.favoriteUrlList;
    newList!.removeWhere((element) => element.url == event.element.url);
    emitter(state.copyWith(favoriteUrlList: newList));
  }
}
