import 'package:flutter/cupertino.dart';
import 'package:swapi_demo/features/dashboard/widgets/category_card.widget.dart';
import 'package:swapi_demo/models/category.dart';

class AnimatedCategoryCard extends StatefulWidget {
  final Category category;
  final int index;

  const AnimatedCategoryCard({required this.category, required this.index, Key? key}) : super(key: key);

  @override
  State<AnimatedCategoryCard> createState() => _AnimatedCategoryCardState();
}

class _AnimatedCategoryCardState extends State<AnimatedCategoryCard> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  double get offset => widget.index.isEven ? 1 : -1;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = Tween<Offset>(begin: Offset(offset, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    Future.delayed(Duration(milliseconds: widget.index * 300 + 100)).then((value) => _controller.forward());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _animation, child: CategoryCard(category: widget.category));
  }
}
