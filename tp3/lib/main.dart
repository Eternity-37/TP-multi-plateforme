import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int numDeGauche = 1;
  int numDeDroite = 1;
  int total = 0;

  void _changer() {
    setState(() {
      if (total >= 100) numDeGauche = Random().nextInt(6) + 1;
      numDeDroite = Random().nextInt(6) + 1;
      total = total + numDeGauche + numDeDroite;
      debugPrint("Gauche : $numDeGauche - Droite : $numDeDroite");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          spacing: 50,
          children: [
            Row(
              spacing: 100,
              mainAxisAlignment: .center,
              children: [
                GestureDetector(
                  onTap: _changer,
                  child: Image.asset('assets/images/de$numDeGauche.png'),
                ),
                GestureDetector(
                  onTap: _changer,
                  child: Image.asset('assets/images/de$numDeDroite.png'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: .center,
              spacing: 100,
              children: [Text('score total : $total')],
            ),
          ],
        ),
      ),
    );
  }
}
