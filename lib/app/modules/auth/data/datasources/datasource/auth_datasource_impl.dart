import 'dart:developer';

import 'package:petfolio/app/core/common/constants/app_api_path.dart';
import 'package:petfolio/app/core/common/errors/exceptions.dart';
import 'package:petfolio/app/core/common/services/requests/request_service.dart';
import 'package:petfolio/app/modules/auth/data/datasources/datasource/auth_datasource.dart';

class AuthDatasourceImpl extends AuthDatasource {
  final RequestService requestService;

  AuthDatasourceImpl({required this.requestService});

  @override
  Future<String> login(String email, String password) async {
    var stop = Stopwatch()..start();
    try {
      var response = await requestService.post(AppApiPath.login, body: {'email': email, 'senha': password});

      log('Tempo de execução: ${stop.elapsed.inMilliseconds}ms');
      stop.stop();
      if ((response.statusCode) >= 200 && (response.statusCode) < 300) {
        return response.data['access_token'];
      } else {
        throw Exception('Erro ao confirmar o código de verificação');
      }
    } catch (err) {
      log('Tempo de execução: ${stop.elapsed.inMilliseconds}ms');
      stop.stop();
      throw ServerException(message: 'Senha ou email inválidos');
    }
  }
}
