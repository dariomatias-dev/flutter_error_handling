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
  cancel, // For request cancellation
  connectTimeout, // For connection timeout errors
  receiveTimeout, // For receiving timeout errors
  sendTimeout, // For sending timeout errors
  networkError, // For network related errors
  badCertificate, // For bad certificate errors
  badResponse, // For bad response errors
  connectionError, // For connection errors
  unknownError, // For unspecified errors
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
