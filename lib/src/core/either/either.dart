import 'package:flutter/material.dart';

part 'success.dart';
part 'failure.dart';

abstract class Either<E extends Exception, S> {
  const Either();

  /// Handles the result of an Either operation.
  T? handle<T>({
    required BuildContext Function() getContext,
    required T Function(S value) success,
    required T Function(
      FailureType type,
      String message,
      void Function() handleError,
    ) failure,
  }) {
    if (this is Success) {
      // Handle success case
      return success((this as Success).value);
    } else {
      // Handle failure case
      final result = this as Failure;

      final failureResult = failure(
        result.type,
        result.message,
        () {
          _handleError(
            getContext,
            result,
          );
        },
      );

      return failureResult;
    }
  }

  void _handleError(
    BuildContext Function() getContext,
    Failure failure,
  ) {
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
        _showAlertDialog(
          getContext,
          'Error',
          failure.message,
        );
    }
  }

  // Alert Dialog Informing About the Error
  void _showAlertDialog(
    BuildContext Function() getContext,
    String title,
    String message,
  ) {
    showDialog(
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
