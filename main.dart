abstract class Either<E extends Exception, S> {
  const Either();
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

void main() {}
