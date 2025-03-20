import 'package:equatable/equatable.dart';

//Modelo padrão para erros futuros
class Failure extends Equatable {
  final String title;
  final String? description;
  final StackTrace? stackTrace;
  const Failure({required this.title, this.description, this.stackTrace});

  @override
  List<Object?> get props => [title, description, stackTrace];
}

//General Failures
class ServerFailure extends Failure {
  const ServerFailure({
    required super.title,
    super.description,
    super.stackTrace,
  });
}

class DatabaseFailure extends Failure {
  final Object? extraData;
  const DatabaseFailure({
    required super.title,
    super.description,
    super.stackTrace,
    this.extraData,
  });
}

class DuplicatedRecordFailure extends Failure {
  final Object? extraData;
  const DuplicatedRecordFailure({
    required super.title,
    super.description,
    super.stackTrace,
    this.extraData,
  });
}

class TokenExpiredFailure extends Failure {
  const TokenExpiredFailure({
    required super.title,
    super.description,
    super.stackTrace,
  });
}
