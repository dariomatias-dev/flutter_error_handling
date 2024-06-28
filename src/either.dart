abstract class Either<E extends Exception, S> {
  const Either();

  T? handle<T>({
    required T Function(S value) success,
    required T Function(
      FailureType type,
      String message,
    ) failure,
  }) {
    if (this is Success) {
      return success((this as Success).value);
    } else {
      final result = (this as Failure);

      return failure(
        result.type,
        result.message,
      );
    }
  }
}

class Success<S> extends Either<Exception, S> {
  const Success({
    required this.value,
  });

  final S value;
}

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
