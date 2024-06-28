import 'dart:async';

import 'api_service.dart';

Future<void> main() async {
  final api = ApiService.jsonPlaceholder;

  final result = await api.get('users');

  result.handle(
    success: (value) {
      print(value);
    },
    failure: (type, message) {
      print(type);
    },
  );
}
