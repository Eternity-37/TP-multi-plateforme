import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config.dart';
import '../models/meteo.dart';

/// Appels à l'API OpenWeatherMap.
class MeteoService {
  Future<Meteo> fetchMeteo(String ville) async {
    final uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'q': ville,
      'appid': apiKey,
      'units': 'metric',
      'lang': 'fr',
    });

    final response = await http.get(uri);

    switch (response.statusCode) {
      case 200:
        return Meteo.fromJson(json.decode(response.body));
      case 404:
        throw Exception('Ville introuvable');
      case 401:
        throw Exception('Clé API invalide ou pas encore activée');
      default:
        throw Exception('Erreur ${response.statusCode}');
    }
  }
}
