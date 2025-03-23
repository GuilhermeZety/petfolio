class AppApiPath {
  static const String _baseUrl = 'https://beta.petfolio.com.br/api';

  static bool get isHML => _baseUrl.contains('beta.');
  static bool get isDebug => _baseUrl.contains('192.');

  //AUTH
  static const String login = '$_baseUrl/login';
  static const String changeUserPhoto = '$_baseUrl/v1/';
  static const String editUser = '$_baseUrl/v1/';
}
