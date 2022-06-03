import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapi_demo/features/category/bloc/category_bloc.dart';
import 'package:swapi_demo/features/category/widgets/animated_category_card.widget.dart';
import 'package:swapi_demo/features/category/widgets/category_card.widget.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(builder: (localContext, state) {
      if (state.categoryList?.isNotEmpty ?? false) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ...state.categoryList!
                  .map((e) => state.loadAnimation
                      ? AnimatedCategoryCard(
                          category: e,
                          index: state.categoryList!.indexOf(e),
                        )
                      : CategoryCard(category: e))
                  .toList()
            ],
          ),
        );
      } else {
        return const SizedBox(height: 100, child: Center(child: CircularProgressIndicator(color: Color(0xFF87CEEB))));
      }
    });
  }
}
