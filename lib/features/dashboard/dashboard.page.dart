import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:swapi_demo/features/dashboard/widgets/animated_category_card.widget.dart';
import 'package:swapi_demo/models/category.dart';
import 'package:swapi_demo/services/root_service.dart';

class DashboardPage extends StatefulWidget {
  static const routeName = 'dashboard';

  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with TickerProviderStateMixin {
  final _rootService = GetIt.I<RootService>();
  late Future _categoryFuture;

  late final AnimationController _titleController;
  late final Animation<double> _titleAnimation;

  @override
  void initState() {
    _titleController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _titleAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _titleController, curve: Curves.easeOut));

    _titleController.forward();

    _categoryFuture = _rootService.getCategories();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 130.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.fromLTRB(20, 80, 20, 0),
                child: ScaleTransition(
                  scale: _titleAnimation,
                  alignment: Alignment.topLeft,
                  child: const Text('Category', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45)),
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FutureBuilder(
                  future: _categoryFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
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
                      return const Center(child: CircularProgressIndicator(color: Colors.amber));
                    }
                  }),
            )
          ]))
        ],
        /*child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ScaleTransition(
                scale: _titleAnimation,
                alignment: Alignment.topLeft,
                child: const Text('Category', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
              ),
              const SizedBox(height: 20),

            ],
          ),
        ),*/
      ),
    );
  }
}
