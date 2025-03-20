import 'package:petfolio/app/core/common/services/requests/request_result.dart';

abstract class RequestService {
  Future<RequestResult> get(String url, {Object? body, Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters, bool authenticated = false});
  Future<RequestResult> post(String url, {Object? body, Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters, bool authenticated = false});
  Future<RequestResult> put(String url, {Object? body, Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters, bool authenticated = false});
  Future<RequestResult> patch(String url, {Object? body, Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters, bool authenticated = false});
  Future<RequestResult> delete(String url, {Object? body, Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters, bool authenticated = false});
}
