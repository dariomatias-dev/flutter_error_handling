part of 'either.dart';

/// Represents Success
class Success<S> extends Either<Exception, S> {
  /// Creates a Success with the specified [value].
  const Success({
    required this.value,
  });

  /// The value of the successful result.
  final S value;
}
