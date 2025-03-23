import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petfolio/app/core/common/services/connection/connection_service.dart';
import 'package:petfolio/app/core/common/services/requests/errors/not_internet_connection_exception.dart';
import 'package:petfolio/app/core/common/services/requests/request_result.dart';
import 'package:petfolio/app/core/common/services/requests/request_service.dart';
import 'package:petfolio/main.dart';

class DioRequestService extends RequestService {
  final Dio _dio;
  DioRequestService({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<RequestResult> get(
    String url, {
    Object? body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    bool authenticated = false,
  }) async {
    try {
      if (!(await _isConnected)) {
        throw NotInternetConnectionException();
      }
      // if (authenticated) {
      //   await Modular.get<UserDatasource>().refreshToken();
      // }
      var response = await _dio.get(
        url,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            if (authenticated) ...{'Authorization': 'Bearer ${session.user?.token}'},
            ...?headers,
          },
        ),
      );
      if ((response.statusCode ?? 404) >= 200 &&
          (response.statusCode ?? 404) < 300) {
        return RequestResult(
          statusCode: response.statusCode ?? 0,
          data: response.data,
          headers: response.headers.map,
          success: true,
          message: response.statusMessage ?? '',
        );
      }
      throw Exception('GET Request Error, no success status code returned');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RequestResult> post(
    String url, {
    Object? body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    bool authenticated = false,
  }) async {
    try {
      if (!(await _isConnected)) {
        throw NotInternetConnectionException();
      }
      // if (authenticated) {
      //   await Modular.get<UserDatasource>().refreshToken();
      // }
      var response = await _dio.post(
        url,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            if (authenticated) ...{'Authorization': 'Bearer ${session.user?.token}'},
            ...?headers,
          },
        ),
      );
      if ((response.statusCode ?? 404) >= 200 &&
          (response.statusCode ?? 404) < 300) {
        return RequestResult(
          statusCode: response.statusCode ?? 0,
          data: response.data,
          headers: response.headers.map,
          success: true,
          message: response.statusMessage ?? '',
        );
      }
      throw Exception('POST Request Error, no success status code returned');
    } on DioException catch (e) {
      log(e.response?.data.toString() ?? '');
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RequestResult> put(
    String url, {
    Object? body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    bool authenticated = false,
  }) async {
    try {
      if (!(await _isConnected)) {
        throw NotInternetConnectionException();
      }
      // if (authenticated) {
      //   await Modular.get<UserDatasource>().refreshToken();
      // }
      var response = await _dio.put(
        url,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            if (authenticated) ...{'Authorization': 'Bearer ${session.user?.token}'},
            ...?headers,
          },
        ),
      );
      if ((response.statusCode ?? 404) >= 200 &&
          (response.statusCode ?? 404) < 300) {
        return RequestResult(
          statusCode: response.statusCode ?? 0,
          data: response.data,
          headers: response.headers.map,
          success: true,
          message: response.statusMessage ?? '',
        );
      }
      throw Exception('PUT Request Error, no success status code returned');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RequestResult> patch(
    String url, {
    Object? body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    bool authenticated = false,
  }) async {
    try {
      if (!(await _isConnected)) {
        throw NotInternetConnectionException();
      }
      //TODO: Faltante Endpoint de refresh

      // if (authenticated) {
      //   await Modular.get<UserDatasource>().refreshToken();
      // }
      var response = await _dio.patch(
        url,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            if (authenticated) ...{'Authorization': 'Bearer ${session.user?.token}'},
            ...?headers,
          },
        ),
      );
      if ((response.statusCode ?? 404) >= 200 &&
          (response.statusCode ?? 404) < 300) {
        return RequestResult(
          statusCode: response.statusCode ?? 0,
          data: response.data,
          headers: response.headers.map,
          success: true,
          message: response.statusMessage ?? '',
        );
      }
      throw Exception('PATCH Request Error, no success status code returned');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RequestResult> delete(
    String url, {
    Object? body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    bool authenticated = false,
  }) async {
    try {
      if (!(await _isConnected)) {
        throw NotInternetConnectionException();
      }
      // if (authenticated) {
      //   await Modular.get<UserDatasource>().refreshToken();
      // }
      var response = await _dio.delete(
        url,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            if (authenticated) ...{'Authorization': 'Bearer ${session.user?.token}'},
            ...?headers,
          },
        ),
      );
      if ((response.statusCode ?? 404) >= 200 &&
          (response.statusCode ?? 404) < 300) {
        return RequestResult(
          statusCode: response.statusCode ?? 0,
          data: response.data,
          headers: response.headers.map,
          success: true,
          message: response.statusMessage ?? '',
        );
      }
      throw Exception('DELETE Request Error, no success status code returned');
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> get _isConnected async =>
      await Modular.get<ConnectionService>().isConnected;
}
