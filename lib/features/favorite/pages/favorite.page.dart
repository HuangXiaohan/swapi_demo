import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapi_demo/features/favorite/bloc/favorite_bloc.dart';
import 'package:swapi_demo/features/resources/widgets/resource_card.widget.dart';

class FavoritePage<T> extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(builder: (localContext, state) {
      return state.favoriteUrlList != null
          ? Column(
              children: [
                ...state.favoriteUrlList!
                    .map((e) =>
                        Padding(padding: const EdgeInsets.symmetric(vertical: 3), child: ResourceCard(element: e)))
                    .toList()
              ],
            )
          : const SizedBox.shrink();
    });
  }
}
