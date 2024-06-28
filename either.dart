abstract class Either<E extends Exception, S> {
  const Either();

  T? handle<T>({
    required T Function(S value) success,
    required T Function(
      FailureType type,
      String message,
    ) failure,
  }) {
    switch (this) {
      case Success(value: var value):
        return success(value);
      case Failure(type: var type, message: var message):
        return failure(
          type,
          message,
        );
      default:
        return null;
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
  generic,
}

class Failure extends Either {
  Failure({
    required this.type,
    required this.message,
  });

  final FailureType type;
  final String message;
}
