import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:swapi_demo/features/category/widgets/animated_category_card.widget.dart';
import 'package:swapi_demo/models/category.dart';
import 'package:swapi_demo/services/root_service.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final _rootService = GetIt.I<RootService>();
  late Future _categoryFuture;

  @override
  void initState() {
    _categoryFuture = _rootService.getCategories();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _categoryFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final list = snapshot.data as List<Category>;
              return Column(
                children: [
                  ...list
                      .map((e) => AnimatedCategoryCard(
                            category: e,
                            index: list.indexOf(e),
                          ))
                      .toList()
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          } else {
            return const SizedBox(
                height: 100, child: Center(child: CircularProgressIndicator(color: Color(0xFF87CEEB))));
          }
        });
  }
}
