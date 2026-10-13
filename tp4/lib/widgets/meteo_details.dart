import 'package:flutter/material.dart';

import '../models/meteo.dart';

/// Affiche le résultat météo : image centrée, température et détails.
class MeteoDetails extends StatelessWidget {
  final Meteo meteo;

  const MeteoDetails({super.key, required this.meteo});

  @override
  Widget build(BuildContext context) {
    final m = meteo;
    final theme = Theme.of(context).textTheme;

    return Column(
      children: [
        Text('${m.ville}, ${m.pays}', style: theme.headlineMedium),
        Image.network(
          m.urlIcone,
          width: 180,
          height: 180,
          errorBuilder: (_, __, ___) => const Icon(Icons.cloud, size: 120),
        ),
        Text(
          m.description[0].toUpperCase() + m.description.substring(1),
          style: theme.titleLarge,
        ),
        Text('${m.temp.toStringAsFixed(1)} °C', style: theme.displayMedium),
        const SizedBox(height: 16),
        Card(
          child: Column(
            children: [
              _ligne(Icons.thermostat, 'Ressenti',
                  '${m.ressenti.toStringAsFixed(1)} °C'),
              _ligne(Icons.arrow_downward, 'Température min',
                  '${m.tempMin.toStringAsFixed(1)} °C'),
              _ligne(Icons.arrow_upward, 'Température max',
                  '${m.tempMax.toStringAsFixed(1)} °C'),
              _ligne(Icons.water_drop, 'Humidité', '${m.humidite} %'),
              _ligne(Icons.air, 'Vent',
                  '${(m.vent * 3.6).toStringAsFixed(1)} km/h (${m.directionVent}°)'),
              _ligne(Icons.speed, 'Pression', '${m.pression} hPa'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _ligne(IconData icone, String label, String valeur) {
    return ListTile(
      leading: Icon(icone),
      title: Text(label),
      trailing: Text(
        valeur,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
