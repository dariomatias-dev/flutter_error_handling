part 'success.dart';
part 'failure.dart';

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
