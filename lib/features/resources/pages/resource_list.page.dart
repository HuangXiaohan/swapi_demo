import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:swapi_demo/features/resources/bloc/resource_bloc.dart';
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
  late Future initFuture;

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
    return BlocProvider<ResourceBloc>(
        create: (_) => ResourceBloc(initFuture: initFuture),
        child: BlocBuilder<ResourceBloc, ResourceState>(builder: (localContext, state) {
          return ResourcePageTemplate(
              category: widget.category,
              loadNextFunc: () => _loadNextFunc(localContext, state),
              isLoadingData: state.isLoadingData,
              body: _buildBody(state));
        }));
  }

  Widget _buildBody(ResourceState state) {
    if (state.resourceList != null) {
      List<dynamic> list = state.resourceList as List<dynamic>;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            SearchBar(textEditingController: textEditingController),
            const SizedBox(height: 20),
            ..._getList(list),
            const SizedBox(height: 20),
            state.next == null
                ? const Text('No more data', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey))
                : state.isLoadingData
                    ? const SizedBox(
                        height: 50, child: Center(child: CircularProgressIndicator(color: Color(0xFF87CEEB))))
                    : const SizedBox.shrink(),
            const SizedBox(height: 40)
          ],
        ),
      );
    } else {
      return const SizedBox(height: 100, child: Center(child: CircularProgressIndicator(color: Color(0xFF87CEEB))));
    }
  }

  List<Widget> _getList(List<dynamic> list) {
    return list
        .map((e) => Visibility(
            visible: _getName(e).toLowerCase().indexOf(textEditingController.text.trim().toLowerCase()) == 0,
            child: Padding(padding: const EdgeInsets.symmetric(vertical: 3), child: ResourceCard(element: e))))
        .toList();
  }

  void _initializeData() {
    switch (widget.category.key) {
      case 'people':
        initFuture = peopleService.getPeople();
        break;
      case 'planets':
        initFuture = planetService.getPlanet();
        break;
      case 'films':
        initFuture = filmService.getFilm();
        break;
      case 'species':
        initFuture = specieService.getSpecie();
        break;
      case 'starships':
        initFuture = starshipService.getStarship();
        break;
      case 'vehicles':
        initFuture = vehicleService.getVehicle();
        break;
    }
  }

  String _getName(dynamic element) {
    if (element.runtimeType == Film) {
      return element.title;
    } else {
      return element.name;
    }
  }

  void _loadNextFunc(BuildContext localContext, ResourceState state) {
    Future nextFuture;
    if (state.next != null) {
      switch (widget.category.key) {
        case 'people':
          nextFuture = peopleService.getPeople(url: state.next);
          break;
        case 'planets':
          nextFuture = planetService.getPlanet(url: state.next);
          break;
        case 'films':
          nextFuture = filmService.getFilm(url: state.next);
          break;
        case 'species':
          nextFuture = specieService.getSpecie(url: state.next);
          break;
        case 'starships':
          nextFuture = starshipService.getStarship(url: state.next);
          break;
        case 'vehicles':
          nextFuture = vehicleService.getVehicle(url: state.next);
          break;
        default:
          nextFuture = peopleService.getPeople(url: state.next);
          break;
      }

      localContext.read<ResourceBloc>().add(ResourceLoadNextDataEvent(nextFuture));
    }
  }
}
