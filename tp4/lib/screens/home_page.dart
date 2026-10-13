import 'package:flutter/material.dart';

import '../models/meteo.dart';
import '../services/meteo_service.dart';
import '../widgets/meteo_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  final MeteoService _service = MeteoService();

  Meteo? _meteo;
  String? _erreur;
  bool _chargement = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _rechercher() {
    final ville = _controller.text.trim();
    if (ville.isEmpty) return;

    FocusScope.of(context).unfocus(); // ferme le clavier

    setState(() {
      _chargement = true;
      _erreur = null;
    });

    _service
        .fetchMeteo(ville)
        .then((meteo) {
          setState(() => _meteo = meteo);
        })
        .catchError((error) {
          setState(() {
            _meteo = null;
            _erreur = error.toString().replaceFirst('Exception: ', '');
          });
        })
        .whenComplete(() {
          setState(() => _chargement = false);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Météo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              textInputAction: TextInputAction.search,
              onSubmitted: (_) => _rechercher(),
              decoration: InputDecoration(
                labelText: 'Ville',
                hintText: 'Ex : Orléans',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _rechercher,
                ),
              ),
            ),
            const SizedBox(height: 24),
            if (_chargement) const CircularProgressIndicator(),
            if (_erreur != null)
              Text(
                _erreur!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                  fontSize: 16,
                ),
              ),
            if (_meteo != null && !_chargement) MeteoDetails(meteo: _meteo!),
          ],
        ),
      ),
    );
  }
}
