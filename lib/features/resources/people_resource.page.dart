import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:swapi_demo/features/resources/widgets/resource_card.widget.dart';
import 'package:swapi_demo/features/resources/widgets/resource_page_template.dart';
import 'package:swapi_demo/models/category.dart';
import 'package:swapi_demo/models/people.dart';
import 'package:swapi_demo/services/people_service.dart';

class PeopleResourcePage extends StatefulWidget {
  static const routeName = 'dashboard/people_resource';
  final Category category;

  const PeopleResourcePage({required this.category, Key? key}) : super(key: key);

  @override
  State<PeopleResourcePage> createState() => _PeopleResourcePageState();
}

class _PeopleResourcePageState extends State<PeopleResourcePage> {
  late Future future;
  final peopleService = GetIt.I<PeopleService>();

  @override
  void initState() {
    future = peopleService.getPeople();
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
                List<People> list = snapshot.data as List<People>;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      ...list
                          .map((e) => Padding(
                                padding: const EdgeInsets.symmetric(vertical: 3),
                                child: ResourceCard(name: e.name, color: const Color(0xFF87CEEB), elements: [
                                  ResourceCardElement(title: 'Height:', content: e.height),
                                  ResourceCardElement(title: 'Mass:', content: e.mass),
                                  ResourceCardElement(title: 'Hair color:', content: e.hair_color),
                                  ResourceCardElement(title: 'Skin color:', content: e.skin_color),
                                  ResourceCardElement(title: 'Eye color:', content: e.eye_color),
                                  ResourceCardElement(title: 'Birth year:', content: e.birth_year),
                                  ResourceCardElement(title: 'Gender:', content: e.gender)
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
