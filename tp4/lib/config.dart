/// Clé API OpenWeatherMap.
/// Remplace la valeur par défaut, ou passe-la au lancement :
///   flutter run --dart-define=API_KEY=ta_cle
const String apiKey =
    String.fromEnvironment('API_KEY', defaultValue: 'VOTRE_CLE_API');
