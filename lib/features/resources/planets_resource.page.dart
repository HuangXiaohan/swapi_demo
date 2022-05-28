import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:swapi_demo/features/resources/widgets/resource_card.widget.dart';
import 'package:swapi_demo/features/resources/widgets/resource_page_template.dart';
import 'package:swapi_demo/models/category.dart';
import 'package:swapi_demo/models/planet.dart';
import 'package:swapi_demo/services/planet_service.dart';

class PlanetsResourcePage extends StatefulWidget {
  static const routeName = 'dashboard/planet_resource';
  final Category category;

  const PlanetsResourcePage({required this.category, Key? key}) : super(key: key);

  @override
  State<PlanetsResourcePage> createState() => _PlanetsResourcePageState();
}

class _PlanetsResourcePageState extends State<PlanetsResourcePage> {
  late Future future;
  final planetService = GetIt.I<PlanetService>();

  @override
  void initState() {
    future = planetService.getPlanet();
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
                List<Planet> list = snapshot.data as List<Planet>;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      ...list
                          .map((e) => Padding(
                                padding: const EdgeInsets.symmetric(vertical: 3),
                                child: ResourceCard(name: e.name, color: const Color(0xFF9370DB), elements: [
                                  ResourceCardElement(title: 'Rotation period:', content: e.rotation_period),
                                  ResourceCardElement(title: 'Orbital period:', content: e.orbital_period),
                                  ResourceCardElement(title: 'Diameter:', content: e.diameter),
                                  ResourceCardElement(title: 'Gravity:', content: e.gravity),
                                  ResourceCardElement(title: 'Terrain:', content: e.terrain),
                                  ResourceCardElement(title: 'Surface water:', content: e.surface_water),
                                  ResourceCardElement(title: 'Population:', content: e.population)
                                ]),
                              ))
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
}
