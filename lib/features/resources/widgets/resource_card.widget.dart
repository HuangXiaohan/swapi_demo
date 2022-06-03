import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapi_demo/features/favorite/bloc/favorite_bloc.dart';
import 'package:swapi_demo/features/resources/widgets/card_template.dart';
import 'package:swapi_demo/models/film.dart';
import 'package:swapi_demo/models/people.dart';
import 'package:swapi_demo/models/planet.dart';
import 'package:swapi_demo/models/specie.dart';
import 'package:swapi_demo/models/starship.dart';
import 'package:swapi_demo/models/vehicle.dart';

class ResourceCard extends StatefulWidget {
  final element;
  final bool canScroll;

  const ResourceCard({required this.element, this.canScroll = false, Key? key}) : super(key: key);

  @override
  State<ResourceCard> createState() => _ResourceCardState();
}

class _ResourceCardState extends State<ResourceCard> {
  late final List<ResourceCardElement> elements = [];
  late final String name;
  late final Color leadingColor;
  late ScrollController _scrollController;
  late double _opacity;

  @override
  void initState() {
    _initData();
    _opacity = 0;
    _scrollController = ScrollController(initialScrollOffset: 0, keepScrollOffset: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(builder: (localContext, state) {
      return Listener(
        onPointerUp: widget.canScroll
            ? (d) {
                if (_scrollController.offset < MediaQuery.of(context).size.width / 5) {
                  _scrollController.animateTo(0, duration: const Duration(milliseconds: 100), curve: Curves.linear);
                  setState(() {
                    _opacity = 0;
                  });
                } else {
                  _scrollController.animateTo(MediaQuery.of(context).size.width / 2,
                      duration: const Duration(milliseconds: 100), curve: Curves.linear);
                  setState(() {
                    _opacity = 1;
                  });
                }
              }
            : null,
        child: SingleChildScrollView(
          physics: widget.canScroll ? const ClampingScrollPhysics() : const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          clipBehavior: Clip.none,
          child: IntrinsicHeight(
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  child: CardTemplate(
                      name: name,
                      color: leadingColor,
                      elements: elements,
                      isFavorite: isInFavorite(state.favoriteList),
                      addFavoriteFunc: () => localContext.read<FavoriteBloc>().add(AddFavoriteEvent(widget.element)),
                      removeFavoriteFunc: () => _showRemoveDialog(context, localContext)),
                ),
                AnimatedOpacity(
                    duration: const Duration(milliseconds: 100),
                    opacity: _opacity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {},
                              child: Container(
                                  width: MediaQuery.of(context).size.width / 4,
                                  color: const Color(0xFFF4A460),
                                  child: const Center(
                                      child: Text(
                                    'Top',
                                    style: TextStyle(color: Colors.white, fontSize: 16),
                                  )))),
                          InkWell(
                              onTap: () {
                                localContext.read<FavoriteBloc>().add(RemoveFavoriteEvent(widget.element));
                              },
                              child: Container(
                                  width: MediaQuery.of(context).size.width / 4,
                                  color: const Color(0xFFF08080),
                                  child: const Center(
                                      child: Text(
                                    'Remove',
                                    style: TextStyle(color: Colors.white, fontSize: 16),
                                  )))),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      );
    });
  }

  void _initData() {
    Map<dynamic, dynamic> map;

    switch (widget.element.runtimeType) {
      case People:
        name = widget.element.name;
        leadingColor = const Color(0xFF87CEEB);
        break;
      case Planet:
        name = widget.element.name;
        leadingColor = const Color(0xFFBC8F8F);
        break;
      case Film:
        name = widget.element.title;
        leadingColor = const Color(0xFFF4A460);
        break;
      case Specie:
        name = widget.element.name;
        leadingColor = const Color(0xFFF08080);
        break;
      case Starship:
        name = widget.element.name;
        leadingColor = const Color(0xFF66CDAA);
        break;
      case Vehicle:
        name = widget.element.name;
        leadingColor = const Color(0xFF9370DB);
        break;
      default:
        name = widget.element.name;
        leadingColor = const Color(0xFF87CEEB);
    }

    map = widget.element.toJson();
    map.forEach((key, value) {
      if (key != 'url') {
        elements.add(ResourceCardElement(title: _getElementTitle(key), content: value.toString()));
      }
    });
  }

  String _getElementTitle(String title) {
    return '${title[0].toUpperCase()}${title.substring(1)}'.replaceAll('_', ' ');
  }

  bool isInFavorite(List? favoriteList) {
    if (favoriteList == null) {
      return false;
    } else {
      var f = favoriteList.where((e) => e.url == widget.element.url);
      return f.isNotEmpty;
    }
  }

  Future<void> _showRemoveDialog(BuildContext context, BuildContext localContext) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Remove favorite'),
          content: const Text('Are you sure to remove the favorite?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                localContext.read<FavoriteBloc>().add(RemoveFavoriteEvent(widget.element));
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
