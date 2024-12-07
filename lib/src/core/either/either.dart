import 'package:flutter/material.dart';

part 'success.dart';
part 'failure.dart';

abstract class Either<E extends Exception, S> {
  const Either();

  /// Handles the result of an Either operation.
  Future<T?> handle<T>({
    required BuildContext Function() getContext,
    required T Function(S value) success,
    required Future<T> Function(
      FailureType type,
      String message,
      Future<void> Function() handleError,
    ) failure,
  }) async {
    if (this is Success) {
      // Handle success case
      return success((this as Success).value);
    }

    // Handle failure case
    final result = this as Failure;

    return await failure(
      result.type,
      result.message,
      () async {
        await _handleError(
          getContext,
          result,
        );
      },
    );
  }

  Future<void> _handleError(
    BuildContext Function() getContext,
    Failure failure,
  ) async {
    switch (failure.type) {
      // Global Handling of Specific Error
      case FailureType.unauthorized:
        Navigator.pushNamedAndRemoveUntil(
          getContext(),
          '/',
          (route) => false,
        );
      // Global Default Error Handling
      default:
        await _showAlertDialog(
          getContext,
          'Error',
          failure.message,
        );
    }
  }

  // Alert Dialog Informing About the Error
  Future<void> _showAlertDialog(
    BuildContext Function() getContext,
    String title,
    String message,
  ) async {
    await showDialog(
      context: getContext(),
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          content: Text(
            message,
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        );
      },
    );
  }
}
