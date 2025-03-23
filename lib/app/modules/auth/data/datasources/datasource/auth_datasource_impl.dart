import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:petfolio/app/core/common/constants/app_api_path.dart';
import 'package:petfolio/app/core/common/errors/exceptions.dart';
import 'package:petfolio/app/core/common/services/requests/request_service.dart';
import 'package:petfolio/app/core/shared/models/user_model.dart';
import 'package:petfolio/app/modules/auth/data/datasources/datasource/auth_datasource.dart';

class AuthDatasourceImpl extends AuthDatasource {
  final RequestService requestService;

  AuthDatasourceImpl({required this.requestService});

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      var response = await requestService.post(
        AppApiPath.login,
        body: {'email': email, 'password': password},
      );

      if ((response.statusCode) >= 200 && (response.statusCode) < 300) {
        return UserModel.fromMap(response.data['data']);
      } else {
        throw Exception('Erro ao fazer login');
      }
    } on DioException catch (err) {
      if (err.response?.statusCode == 401) {
        throw ServerException(title: 'Senha ou email inválidos');
      }
      throw ServerException(
        title: (err.response?.data['message'] ?? 'Ocorreu um erro inesperado!'),
      );
    } catch (err, stt) {
      log(err.toString(), stackTrace: stt);
      throw ServerException(title: 'Ocorreu um erro inesperado!');
    }
  }
}
