import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:swapi_demo/features/resources/widgets/resource_card.widget.dart';
import 'package:swapi_demo/features/resources/widgets/resource_page_template.dart';
import 'package:swapi_demo/features/resources/widgets/search_bar.widget.dart';
import 'package:swapi_demo/models/category.dart';
import 'package:swapi_demo/models/film.dart';
import 'package:swapi_demo/services/film_service.dart';
import 'package:swapi_demo/services/people_service.dart';
import 'package:swapi_demo/services/planet_service.dart';
import 'package:swapi_demo/services/specie_service.dart';
import 'package:swapi_demo/services/starship_service.dart';
import 'package:swapi_demo/services/vehicle_service.dart';

class ResourceListPage extends StatefulWidget {
  static const routeName = 'category/resource_list';
  final Category category;

  const ResourceListPage({required this.category, Key? key}) : super(key: key);

  @override
  State<ResourceListPage> createState() => _ResourceListPageState();
}

class _ResourceListPageState<T> extends State<ResourceListPage> {
  late Future future;

  final peopleService = GetIt.I<PeopleService>();
  final planetService = GetIt.I<PlanetService>();
  final filmService = GetIt.I<FilmService>();
  final specieService = GetIt.I<SpecieService>();
  final starshipService = GetIt.I<StarshipService>();
  final vehicleService = GetIt.I<VehicleService>();

  late final TextEditingController textEditingController;

  @override
  void initState() {
    _initializeData();

    textEditingController = TextEditingController();

    textEditingController.addListener(() {
      setState(() {});
    });

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
                List<dynamic> list = snapshot.data as List<dynamic>;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      SearchBar(textEditingController: textEditingController),
                      const SizedBox(height: 20),
                      ..._getList(_onSearch((list)))
                    ],
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            } else {
              return const SizedBox(
                  height: 100, child: Center(child: CircularProgressIndicator(color: Color(0xFF87CEEB))));
            }
          },
        ));
  }

  List<Widget> _getList(List<dynamic> list) {
    return list
        .map((e) => Padding(padding: const EdgeInsets.symmetric(vertical: 3), child: ResourceCard(element: e)))
        .toList();
  }

  void _initializeData() {
    switch (widget.category.key) {
      case 'people':
        future = peopleService.getPeople();
        break;
      case 'planets':
        future = planetService.getPlanet();
        break;
      case 'films':
        future = filmService.getFilm();
        break;
      case 'species':
        future = specieService.getSpecie();
        break;
      case 'starships':
        future = starshipService.getStarship();
        break;
      case 'vehicles':
        future = vehicleService.getVehicle();
        break;
    }
  }

  List<dynamic> _onSearch(List<dynamic> list) {
    var newList = list
        .where((e) => _getName(e).toLowerCase().indexOf(textEditingController.text.trim().toLowerCase()) == 0)
        .toList();
    return newList;
  }

  String _getName(dynamic element) {
    if (element.runtimeType == Film) {
      return element.title;
    } else {
      return element.name;
    }
  }
}
