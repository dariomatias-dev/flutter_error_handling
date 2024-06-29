part of 'either.dart';

enum FailureType {
  unauthorized,
  badRequest,
  notFound,
  internalServerError,
  serviceUnavailable,
  requestTimeout,
  conflict,
  methodNotAllowed,
  tooManyRequests,
  forbidden,
  badGateway,
  generic,
}

class Failure<E extends Exception, S> extends Either<E, S> {
  Failure({
    required this.type,
    required this.message,
  });

  final FailureType type;
  final String message;
}
