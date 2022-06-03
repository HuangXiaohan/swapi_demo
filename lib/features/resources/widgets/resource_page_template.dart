import 'package:flutter/material.dart';
import 'package:swapi_demo/models/category.dart';

class ResourcePageTemplate extends StatefulWidget {
  final Category category;
  final Widget body;
  final VoidCallback loadNextFunc;
  final bool isLoadingData;

  const ResourcePageTemplate(
      {required this.category, required this.body, required this.loadNextFunc, required this.isLoadingData, Key? key})
      : super(key: key);

  @override
  State<ResourcePageTemplate> createState() => _ResourcePageTemplateState();
}

class _ResourcePageTemplateState extends State<ResourcePageTemplate> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation colorTween;
  late final ScrollController scrollController;

  ValueNotifier<bool> isExpanded = ValueNotifier(true);

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    colorTween = ColorTween(begin: Colors.white, end: Colors.black).animate(animationController);

    scrollController = ScrollController(initialScrollOffset: 0, keepScrollOffset: false);

    scrollController.addListener(() {
      isExpanded.value = scrollController.offset < 100;

      // lazy loading if has next
      if (scrollController.position.extentAfter < 10 && !widget.isLoadingData) {
        widget.loadNextFunc();
      }
    });

    isExpanded.addListener(() {
      isExpanded.value ? animationController.reverse() : animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            title: _buildTitle(),
            centerTitle: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 130.0,
            flexibleSpace: FlexibleSpaceBar(background: _buildHeaderImage()),
            leading: _buildLeading(context),
          ),
          SliverList(delegate: SliverChildListDelegate([widget.body]))
        ],
      ),
    );
  }

  Widget _buildTitle() {
    final title = '${widget.category.key[0].toUpperCase()}${widget.category.key.substring(1)} list';
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Text(title, style: TextStyle(color: colorTween.value));
        });
  }

  Widget _buildHeaderImage() {
    return ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            begin: Alignment(0, -0.2),
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.transparent],
          ).createShader(Rect.fromLTRB(
            0,
            0,
            bounds.width,
            bounds.height,
          ));
        },
        blendMode: BlendMode.dstIn,
        child: Image.asset(
          widget.category.image,
          height: 100,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ));
  }

  Widget _buildLeading(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
                alignment: Alignment.centerLeft,
                icon: Icon(Icons.arrow_back_ios, size: 32, color: colorTween.value),
                onPressed: Navigator.of(context).pop),
          );
        });
  }
}
