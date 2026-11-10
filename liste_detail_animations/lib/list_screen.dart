import 'package:flutter/material.dart';

import 'item.dart';
import 'detail_screen.dart';

// Écran principal avec la liste
class ListScreen extends StatelessWidget {
  final List<Item> items = ITEMS;

  ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Liste des éléments")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(item: item),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(item.title, style: const TextStyle(fontSize: 18)),
                    const Spacer(),
                    Hero(
                      tag: item.image,
                      child: Image.asset(item.image, width: 80, height: 80),
                    ),
                    const Spacer(),
                    Text(
                      item.number.toString(),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
