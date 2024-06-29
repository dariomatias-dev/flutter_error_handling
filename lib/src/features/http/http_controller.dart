import 'package:flutter_error_handling/src/features/http/status_codes.dart';

import 'package:flutter_error_handling/src/services/api_service/api_service.dart';

class HttpController {
  static final _api = ApiService.http;

  int statusCode = statusCodes.first;

  Future<void> request() async {
    final result = await _api.get('$statusCodes');

    result.handle(
      success: (value) {
        print(value);
      },
      failure: (type, message) {
        print(message);
      },
    );
  }
}
