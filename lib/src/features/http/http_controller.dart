import 'package:flutter/material.dart';

import 'package:flutter_error_handling/src/core/either/either.dart';

import 'package:flutter_error_handling/src/features/http/status_codes.dart';

import 'package:flutter_error_handling/src/services/api_service/api_service.dart';

import 'package:flutter_error_handling/src/shared/utils/show_loading.dart';

class HttpController {
  HttpController({
    required BuildContext Function() getContext,
  }) : _getContext = getContext;

  final BuildContext Function() _getContext;

  final _api = ApiService.http;

  int statusCode = statusCodes.first;

  Future<void> request() async {
    final result = await showLoading(
      _getContext(),
      () async {
        return await _api.get('$statusCode');
      },
    );

    await result.handle(
      getContext: _getContext,
      success: (value) {},
      failure: (type, message, handleError) async {
        await _handleError(type, handleError);
      },
    );
  }

  Future<void> _handleError(
    FailureType type,
    Future<void> Function() handleError,
  ) async {
    switch (type) {
      case FailureType.badGateway:
        await showDialog(
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
        await handleError();
    }
  }

  void dispose() {
    _api.close();
  }
}
