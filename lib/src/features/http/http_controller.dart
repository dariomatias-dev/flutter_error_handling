import 'package:flutter/material.dart';

import 'package:flutter_error_handling/src/core/either/either.dart';

import 'package:flutter_error_handling/src/features/http/status_codes.dart';

import 'package:flutter_error_handling/src/services/api_service/api_service.dart';

import 'package:flutter_error_handling/src/shared/utils/show_loading_screen.dart';

class HttpController {
  HttpController({
    required BuildContext Function() getContext,
  }) : _getContext = getContext;

  final BuildContext Function() _getContext;

  static final _api = ApiService.http;

  int statusCode = statusCodes.first;

  void request() {
    showLoadingScreen(
      _getContext(),
      () async {
        final result = await _api.get('$statusCode');

        result.handle(
          getContext: _getContext,
          success: (value) {},
          failure: (type, message, handleError) {
            _handleError(type, handleError);
          },
        );
      },
    );
  }

  void _handleError(
    FailureType type,
    void Function() handleError,
  ) {
    switch (type) {
      case FailureType.badGateway:
        showDialog(
          context: _getContext(),
          builder: (context) {
            return AlertDialog(
              title: const Text(
                'Local Treatment',
                textAlign: TextAlign.center,
              ),
              content: const Text(
                'Local error handling',
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Ok'),
                ),
              ],
            );
          },
        );
        break;
      default:
        handleError();
    }
  }

  void close() {
    _api.close();
  }
}
