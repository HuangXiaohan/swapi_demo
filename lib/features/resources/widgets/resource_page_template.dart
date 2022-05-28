import 'package:flutter/material.dart';
import 'package:swapi_demo/models/category.dart';

class ResourcePageTemplate extends StatelessWidget {
  final Category category;
  final Widget body;

  const ResourcePageTemplate({required this.category, required this.body, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
          SliverList(delegate: SliverChildListDelegate([body]))
        ],
      ),
    );
  }

  Widget _buildTitle() {
    final title = '${category.key[0].toUpperCase()}${category.key.substring(1)} list';
    return Text(title, style: const TextStyle(color: Colors.black));
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
          category.getImage(),
          height: 100,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ));
  }

  Widget _buildLeading(BuildContext context) {
    return IconButton(
        alignment: Alignment.centerLeft,
        icon: const Icon(Icons.arrow_back_ios, size: 32, color: Colors.black),
        onPressed: Navigator.of(context).pop);
  }
}
