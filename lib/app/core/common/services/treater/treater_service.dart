import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:petfolio/app/core/common/errors/exceptions.dart';
import 'package:petfolio/app/core/common/errors/failures.dart';
import 'package:petfolio/app/core/common/features/fp.dart';
import 'package:petfolio/app/core/common/services/connection/connection_service_impl.dart';

class TreaterService {
  Future<Either<Failure, T>> call<T>(
    Future<T> Function() code, {
    String? errorIdentification,
    bool online = true,
  }) async {
    if (await isConnected || !online) {
      try {
        return Either.success(await code());
      } on TokenExpiredException catch (e, stt) {
        log(
          'O token do usuário foi expirado',
          stackTrace: stt,
          name: 'TokenExpiredFailure',
        );

        return Either.failure(
          TokenExpiredFailure(
            title: 'O token do usuário foi expirado',
            stackTrace: stt,
          ),
        );
      } on DioException catch (e, stt) {
        if (e.error is SocketException) {
          return Either.failure(
            Failure(
              title: 'Houve um erro no servidor',
              description: 'Tente novamente mais tarde',
              stackTrace: stt,
            ),
          );
        }
        log(e.message ?? e.toString(), stackTrace: stt, name: 'DioException');

        return Either.failure(
          Failure(
            title:
                e.response?.data['message'] ??
                e.response?.data['error'] ??
                e.message ??
                errorIdentification ??
                '',
            // description: e.message,
            stackTrace: stt,
          ),
        );
      } on ServerException catch (e, stt) {
        log(e.message ?? e.toString(), stackTrace: stt);

        return Either.failure(
          Failure(title: e.message ?? errorIdentification ?? '', stackTrace: stt),
        );
      } on Exception catch (e, stt) {
        log(e.toString(), stackTrace: stt);

        return Either.failure(Failure(title: e.toString()));
      } on Failure catch (e, stt) {
        log(e.toString(), stackTrace: stt);

        return Either.failure(e);
      } catch (e, stt) {
        if (e is TypeError) {
          log(e.toString(), error: e, stackTrace: stt, name: 'TypeError');
        } else {
          log(e.toString(), error: e, stackTrace: stt);
        }
        if (e is ServerException) {
          return Either.failure(ServerFailure(title: e.message ?? ''));
        }
        return Either.failure(Failure(title: e.toString()));
      }
    } else {
      return Either.failure(const Failure(title: 'Sem conexão com a internet'));
    }
  }

  Future<bool> isConnected = ConnectionServiceImpl().isConnected;
}
