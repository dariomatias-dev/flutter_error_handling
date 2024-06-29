import 'package:flutter/material.dart';

part 'success.dart';
part 'failure.dart';

abstract class Either<E extends Exception, S> {
  const Either();

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
      return success((this as Success).value);
    } else {
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
      case FailureType.unauthorized:
        Navigator.pushNamedAndRemoveUntil(
          getContext(),
          '/',
          (route) => false,
        );
      default:
        _showAlertDialog(
          getContext,
          'Error',
          failure.message,
        );
    }
  }

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
          ),
        );
      },
    );
  }
}
