import 'either.dart';

void main() {
  Either result = Success<String?>(
    value: null,
  );

  result.handle(
    success: (value) {},
    failure: (type, message) {},
  );
}
