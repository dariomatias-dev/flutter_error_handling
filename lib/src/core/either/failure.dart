part of 'either.dart';

// Mapped Failure Types
enum FailureType {
  badRequest, // 400
  unauthorized, // 401
  forbidden, // 403
  notFound, // 404
  methodNotAllowed, // 405
  requestTimeout, // 408
  conflict, // 409
  tooManyRequests, // 429
  internalServerError, // 500
  badGateway, // 502
  serviceUnavailable, // 503
  generic, // For unspecified errors
}

/// Represents a failure in the application.
class Failure<E extends Exception, S> extends Either<E, S> {
  /// Creates a Failure with the specified [type] and [message].
  const Failure({
    required this.type,
    required this.message,
  });

  /// Type of the failure.
  final FailureType type;

  /// Message describing the failure.
  final String message;
}
