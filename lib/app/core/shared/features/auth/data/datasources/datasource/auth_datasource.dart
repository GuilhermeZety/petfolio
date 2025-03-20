abstract class AuthDatasource {
  Future<String> login(String document);
  Future<bool> updateHash(String hash);
}
