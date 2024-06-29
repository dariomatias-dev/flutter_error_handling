import 'package:flutter/material.dart';

import 'package:flutter_error_handling/src/features/http/status_codes.dart';

import 'package:flutter_error_handling/src/services/api_service/api_service.dart';

class HttpController {
  HttpController({
    required BuildContext Function() getContext,
  }) : _getContext = getContext;

  final BuildContext Function() _getContext;

  static final _api = ApiService.http;

  int statusCode = statusCodes.first;

  Future<void> request() async {
    final result = await _api.get('$statusCode');

    result.handle(
      getContext: _getContext,
      success: (value) {},
      failure: (type, message, handleError) {
        handleError();
      },
    );
  }
}
