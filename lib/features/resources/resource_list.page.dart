import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:swapi_demo/features/resources/widgets/resource_card.widget.dart';
import 'package:swapi_demo/features/resources/widgets/resource_page_template.dart';
import 'package:swapi_demo/models/category.dart';
import 'package:swapi_demo/models/film.dart';
import 'package:swapi_demo/models/people.dart';
import 'package:swapi_demo/models/planet.dart';
import 'package:swapi_demo/models/specie.dart';
import 'package:swapi_demo/models/starship.dart';
import 'package:swapi_demo/models/vehicle.dart';
import 'package:swapi_demo/services/film_service.dart';
import 'package:swapi_demo/services/people_service.dart';
import 'package:swapi_demo/services/planet_service.dart';
import 'package:swapi_demo/services/specie_service.dart';
import 'package:swapi_demo/services/starship_service.dart';
import 'package:swapi_demo/services/vehicle_service.dart';

class ResourceListPage<T> extends StatefulWidget {
  static const routeName = 'dashboard/resource_list';
  final Category category;

  const ResourceListPage({required this.category, Key? key}) : super(key: key);

  @override
  State<ResourceListPage> createState() => _ResourceListPageState();
}

class _ResourceListPageState<T> extends State<ResourceListPage> {
  late Future future;
  late Color leadingColor;

  final peopleService = GetIt.I<PeopleService>();
  final planetService = GetIt.I<PlanetService>();
  final filmService = GetIt.I<FilmService>();
  final specieService = GetIt.I<SpecieService>();
  final starshipService = GetIt.I<StarshipService>();
  final vehicleService = GetIt.I<VehicleService>();

  @override
  void initState() {
    _initializeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResourcePageTemplate(
        category: widget.category,
        body: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                List<T> list = snapshot.data as List<T>;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      ...list
                          .map((e) =>
                              Padding(padding: const EdgeInsets.symmetric(vertical: 3), child: _getResourceCard(e)))
                          .toList()
                    ],
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            } else {
              return const SizedBox(height: 100, child: Center(child: CircularProgressIndicator(color: Colors.amber)));
            }
          },
        ));
  }

  void _initializeData() {
    switch (widget.category.key) {
      case 'people':
        future = peopleService.getPeople();
        leadingColor = const Color(0xFF87CEEB);
        break;
      case 'planets':
        future = planetService.getPlanet();
        leadingColor = const Color(0xFFBC8F8F);
        break;
      case 'films':
        future = filmService.getFilm();
        leadingColor = const Color(0xFFF4A460);
        break;
      case 'species':
        future = specieService.getSpecie();
        leadingColor = const Color(0xFFF08080);
        break;
      case 'starships':
        future = starshipService.getStarship();
        leadingColor = const Color(0xFF66CDAA);
        break;
      case 'vehicles':
        future = vehicleService.getVehicle();
        leadingColor = const Color(0xFF9370DB);
        break;
    }
  }

  Widget _getResourceCard(T e) {
    Map<dynamic, dynamic> map;
    final List<ResourceCardElement> elements = [];
    final String name;
    switch (widget.category.key) {
      case 'people':
        map = (e as People).toJson();
        name = e.name;
        break;
      case 'planets':
        map = (e as Planet).toJson();
        name = e.name;
        break;
      case 'films':
        map = (e as Film).toJson();
        name = e.title;
        break;
      case 'species':
        map = (e as Specie).toJson();
        name = e.name;
        break;
      case 'starships':
        map = (e as Starship).toJson();
        name = e.name;
        break;
      case 'vehicles':
        map = (e as Vehicle).toJson();
        name = e.name;
        break;
      default:
        map = (e as People).toJson();
        name = e.name;
    }

    map.forEach((key, value) {
      if (key != 'url') {
        elements.add(ResourceCardElement(title: _getElementTitle(key), content: value.toString()));
      }
    });

    return ResourceCard(name: name, color: leadingColor, elements: elements);
  }

  String _getElementTitle(String title) {
    return '${title[0].toUpperCase()}${title.substring(1)}'.replaceAll('_', ' ');
  }
}
