import 'package:flutter/material.dart';
import 'package:swapi_demo/features/resources/people_resource.page.dart';
import 'package:swapi_demo/features/resources/planets_resource.page.dart';
import 'package:swapi_demo/models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({required this.category, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 5 / 2,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(category.getImage(), fit: BoxFit.cover)),
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 20,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.white.withOpacity(0.85),
                    Colors.white.withOpacity(0),
                  ], begin: Alignment.centerRight, end: Alignment.centerLeft)),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        category.key.toUpperCase(),
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.black.withOpacity(0.75),
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 1.5),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void onTap(BuildContext context) {
    switch (category.key) {
      case 'people':
        Navigator.of(context).pushNamed(PeopleResourcePage.routeName, arguments: category);
        break;
      case 'planets':
        Navigator.of(context).pushNamed(PlanetsResourcePage.routeName, arguments: category);
        break;
    }
    ;
  }
}
