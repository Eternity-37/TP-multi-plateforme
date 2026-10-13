/// Modèle des données météo utiles, construit à partir du JSON de l'API.
class Meteo {
  final String ville;
  final String pays;
  final String description;
  final String icone;
  final double temp;
  final double ressenti;
  final double tempMin;
  final double tempMax;
  final int humidite;
  final int pression;
  final double vent; // m/s
  final int directionVent;

  Meteo({
    required this.ville,
    required this.pays,
    required this.description,
    required this.icone,
    required this.temp,
    required this.ressenti,
    required this.tempMin,
    required this.tempMax,
    required this.humidite,
    required this.pression,
    required this.vent,
    required this.directionVent,
  });

  factory Meteo.fromJson(Map<String, dynamic> json) {
    return Meteo(
      ville: json['name'],
      pays: json['sys']['country'],
      description: json['weather'][0]['description'],
      icone: json['weather'][0]['icon'],
      temp: (json['main']['temp'] as num).toDouble(),
      ressenti: (json['main']['feels_like'] as num).toDouble(),
      tempMin: (json['main']['temp_min'] as num).toDouble(),
      tempMax: (json['main']['temp_max'] as num).toDouble(),
      humidite: json['main']['humidity'],
      pression: json['main']['pressure'],
      vent: (json['wind']['speed'] as num).toDouble(),
      directionVent: ((json['wind']['deg'] ?? 0) as num).toInt(),
    );
  }

  /// URL de l'image fournie par OpenWeatherMap (@4x = grande taille)
  String get urlIcone => 'https://openweathermap.org/img/wn/$icone@4x.png';
}
