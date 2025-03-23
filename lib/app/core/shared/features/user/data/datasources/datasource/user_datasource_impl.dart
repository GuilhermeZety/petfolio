import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:petfolio/app/core/common/constants/app_api_path.dart';
import 'package:petfolio/app/core/common/errors/exceptions.dart';
import 'package:petfolio/app/core/common/services/requests/request_service.dart';
import 'package:petfolio/app/core/shared/features/user/data/datasources/datasource/user_datasource.dart';

class UserDatasourceImpl extends UserDatasource {
  final RequestService requestService;

  UserDatasourceImpl({required this.requestService});

  @override
  Future<bool> changeUserPhoto(String path) async {
    try {
      var response = await requestService.patch(
        AppApiPath.changeUserPhoto,
        authenticated: true,
        body: FormData.fromMap({
          'photo': await MultipartFile.fromFile(
            path,
            contentType: DioMediaType.parse(lookupMimeType(path)!),
          ),
        }),
      );

      if ((response.statusCode) >= 200 && (response.statusCode) < 300) {
        return true;
      }
      throw Exception('Erro ao buscar informações do usuário');
    } on DioException catch (err) {
      if (err.response?.statusCode == 401) {
        throw TokenExpiredException();
      } else {
        rethrow;
      }
    } catch (err) {
      rethrow;
    }
  }
}
