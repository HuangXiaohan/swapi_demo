import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteState()) {
    on<AddFavoriteEvent>(_addFavorite);
    on<RemoveFavoriteEvent>(_removeFavorite);
  }

  void _addFavorite(AddFavoriteEvent event, Emitter emitter) {
    var newList = state.favoriteList ?? [];
    newList.add(event.element);
    emitter(state.copyWith(favoriteList: newList));
  }

  void _removeFavorite(RemoveFavoriteEvent event, Emitter emitter) {
    var newList = List.from(state.favoriteList!);
    newList.removeWhere((element) => element.url == event.element.url);
    emitter(state.copyWith(favoriteList: newList));
  }
}
