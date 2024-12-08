part of 'either.dart';

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
