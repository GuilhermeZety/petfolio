class AppApiPath {
  static const String _baseUrl = 'a configurar';

  static bool get isHML => _baseUrl.contains('hml.');
  static bool get isDebug => _baseUrl.contains('192.');

  //AUTH
  static const String login = '$_baseUrl/v1/';
  static const String updateHash = '$_baseUrl/v1/';
  static const String refreshToken = '$_baseUrl/v1/';
  static const String userInfo = '$_baseUrl/v1/';
  static const String changeUserPhoto = '$_baseUrl/v1/';
  static const String editUser = '$_baseUrl/v1/';
}
