import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapi_demo/features/favorite/bloc/favorite_bloc.dart';
import 'package:swapi_demo/features/resources/widgets/resource_card.widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
        buildWhen: (previous, current) => previous.favoriteList != current.favoriteList,
        builder: (localContext, state) {
          if (state.favoriteList?.isNotEmpty ?? false) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                    key: Key(state.favoriteList!.length.toString()),
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.favoriteList!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: ResourceCard(element: state.favoriteList![index], canScroll: true));
                    }));
          } else {
            return const Text(
              'No favorites',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            );
          }
        });
  }
}
