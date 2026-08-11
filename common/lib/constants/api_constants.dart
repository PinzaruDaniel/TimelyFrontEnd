class ApiConstants {
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://127.0.0.1:8000',
  );
  static const Map<String, String> authHeader = {
    'Authorization':
        'Bearer YourSuperSecretKeyThatIsAtLeast32CharactersLongForHS256Algorithm',
    //'Authorization': 'f3_A07&L3KGg?,3?^#a*dy#/C).wi9g{z]WKi_s@RQy'
  };
}
