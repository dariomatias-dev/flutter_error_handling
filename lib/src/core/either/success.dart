part of 'either.dart';

class Success<S> extends Either<Exception, S> {
  const Success({
    required this.value,
  });

  final S value;
}
