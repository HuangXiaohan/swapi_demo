import 'package:flutter/material.dart';
import 'package:swapi_demo/features/category/pages/category.page.dart';
import 'package:swapi_demo/features/favorite/pages/favorite.page.dart';

class DashboardPage extends StatefulWidget {
  static const routeName = 'dashboard';

  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with TickerProviderStateMixin {
  late int _selectedIndex;

  late final AnimationController _titleController;
  late final Animation<double> _titleAnimation;

  @override
  void initState() {
    _selectedIndex = 0;

    _titleController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _titleAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _titleController, curve: Curves.easeOut));

    _titleController.forward();

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
                  child: Text(_getTitle(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 45)),
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
                  [Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: _buildBody())]))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        unselectedFontSize: 10,
        selectedItemColor: const Color(0xFF87CEEB),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return const CategoryPage();
      default:
        return const FavoritePage();
    }
  }

  String _getTitle() {
    switch (_selectedIndex) {
      case 0:
        return 'Category';
      case 1:
        return 'Favorite';
      default:
        return 'Category';
    }
  }
}
