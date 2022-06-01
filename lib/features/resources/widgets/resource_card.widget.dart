import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapi_demo/features/favorite/bloc/favorite_bloc.dart';
import 'package:swapi_demo/features/resources/widgets/card_template.dart';
import 'package:swapi_demo/models/film.dart';
import 'package:swapi_demo/models/people.dart';
import 'package:swapi_demo/models/planet.dart';
import 'package:swapi_demo/models/specie.dart';
import 'package:swapi_demo/models/starship.dart';
import 'package:swapi_demo/models/vehicle.dart';

class ResourceCard extends StatelessWidget {
  final element;

  const ResourceCard({required this.element, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> map;
    final List<ResourceCardElement> elements = [];
    final String name;
    final Color leadingColor;
    switch (element.runtimeType) {
      case People:
        name = element.name;
        leadingColor = const Color(0xFF87CEEB);
        break;
      case Planet:
        name = element.name;
        leadingColor = const Color(0xFFBC8F8F);
        break;
      case Film:
        name = element.title;
        leadingColor = const Color(0xFFF4A460);
        break;
      case Specie:
        name = element.name;
        leadingColor = const Color(0xFFF08080);
        break;
      case Starship:
        name = element.name;
        leadingColor = const Color(0xFF66CDAA);
        break;
      case Vehicle:
        name = element.name;
        leadingColor = const Color(0xFF9370DB);
        break;
      default:
        name = element.name;
        leadingColor = const Color(0xFF87CEEB);
    }

    map = element.toJson();
    map.forEach((key, value) {
      if (key != 'url') {
        elements.add(ResourceCardElement(title: _getElementTitle(key), content: value.toString()));
      }
    });

    return BlocBuilder<FavoriteBloc, FavoriteState>(builder: (localContext, state) {
      return CardTemplate(
          name: name,
          color: leadingColor,
          elements: elements,
          isFavorite: isInFavorite(state.favoriteUrlList),
          addFavoriteFunc: () => localContext.read<FavoriteBloc>().add(AddFavoriteEvent(element)),
          removeFavoriteFunc: () => localContext.read<FavoriteBloc>().add(RemoveFavoriteEvent(element)));
    });
  }

  String _getElementTitle(String title) {
    return '${title[0].toUpperCase()}${title.substring(1)}'.replaceAll('_', ' ');
  }

  bool isInFavorite(List? favoriteList) {
    if (favoriteList == null) {
      return false;
    } else {
      var f = favoriteList.where((e) => e.url == element.url);
      return f.isNotEmpty;
    }
  }
}
