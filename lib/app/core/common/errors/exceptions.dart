// ignore_for_file: public_member_api_docs, sort_constructors_first
class ServerException implements Exception {
  final String title;
  final String? description;
  final StackTrace? stackTrace;
  ServerException({required this.title, this.stackTrace, this.description});
}

class DBException implements Exception {
  final String title;
  final String? description;
  final StackTrace? stackTrace;
  final Object? extraData;

  const DBException({
    required this.title,
    this.description,
    this.stackTrace,
    this.extraData,
  });
}

class DuplicatedRecordException extends DBException {
  const DuplicatedRecordException({
    required super.title,
    super.description,
    super.stackTrace,
    super.extraData,
  });
}

class TokenExpiredException implements Exception {}
