import 'package:flutter/material.dart';

import 'item.dart';

// Écran de détail
class DetailScreen extends StatelessWidget {
  final Item item;

  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Détail de l'élément")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: item.image,
              child: Image.asset(item.image, width: 300, height: 300),
            ),
            const SizedBox(height: 20),
            Text(item.title, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            Text(
              "Nombre : ${item.number}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "${item.description}",
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
