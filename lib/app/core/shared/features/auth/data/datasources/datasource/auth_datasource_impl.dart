import 'package:petfolio/app/core/common/constants/app_api_path.dart';
import 'package:petfolio/app/core/common/services/requests/request_service.dart';
import 'package:petfolio/app/core/shared/features/auth/data/datasources/datasource/auth_datasource.dart';

class AuthDatasourceImpl extends AuthDatasource {
  final RequestService requestService;

  AuthDatasourceImpl({required this.requestService});

  @override
  Future<String> login(String document) async {
    var response = await requestService.post(AppApiPath.login, body: {'cpf': document});

    if ((response.statusCode) >= 200 && (response.statusCode) < 300) {
      return response.data['access_token'];
    } else {
      throw Exception('Erro ao logar o usuário');
    }
  }

  @override
  Future<bool> updateHash(String hash) async {
    var response = await requestService.patch(AppApiPath.updateHash, body: {'hash_notification': hash}, authenticated: true);

    if ((response.statusCode) >= 200 && (response.statusCode) < 300) {
      return true;
    } else {
      throw Exception('Erro ao atualizar o hash');
    }
  }
}
