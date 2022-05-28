import 'package:flutter/material.dart';

class ResourceCard extends StatelessWidget {
  final Color color;
  final String name;
  final List<ResourceCardElement> elements;

  const ResourceCard({required this.elements, required this.color, required this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                            colors: [color, color.withOpacity(0.1)],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight)),
                    child: _buildTitle()),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(name,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                ),
                InkWell(child: const Icon(Icons.favorite_outline_outlined, color: Colors.grey, size: 32), onTap: () {})
              ],
            ),
            const SizedBox(height: 20),
            ...elements.map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.title),
                      Flexible(child: Text(e.content, style: const TextStyle(fontStyle: FontStyle.italic)))
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    final splits = name.split(' ');
    var title = '';
    for (var s in splits) {
      title += s[0].toUpperCase();
    }

    return Center(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15)));
  }
}

class ResourceCardElement {
  final String title;
  final String content;

  ResourceCardElement({required this.title, required this.content});
}
