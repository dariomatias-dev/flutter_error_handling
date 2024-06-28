import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'either.dart';

class ApiService {
  final _dio = Dio();
  final _logger = Logger();

  Future<Either> get(
    String path, {
    Map<String, dynamic>? headers,
  }) async {
    return _handleRequest(
      () async {
        return await _dio.get(path);
      },
    );
  }

  Future<Either> post(
    String path, {
    Map<String, dynamic>? headers,
  }) async {
    return _handleRequest(
      () async {
        return await _dio.post(path);
      },
    );
  }

  Future<Either> patch(
    String path, {
    Map<String, dynamic>? headers,
  }) async {
    return _handleRequest(
      () async {
        return await _dio.patch(path);
      },
    );
  }

  Future<Either> put(
    String path, {
    Map<String, dynamic>? headers,
  }) async {
    return _handleRequest(
      () async {
        return await _dio.put(path);
      },
    );
  }

  Future<Either> delete(
    String path, {
    Map<String, dynamic>? headers,
  }) async {
    return _handleRequest(
      () async {
        return await _dio.delete(path);
      },
    );
  }

  Future<Either> _handleRequest(
    Future<Response> Function() request,
  ) async {
    try {
      final result = await request();

      if (result.statusCode == 200 || result.statusCode == 201) {
        return Success(
          value: result.data,
        );
      }

      _logger.w(
        'Warning Log',
        error: result.data,
      );

      return Failure(
        type: FailureType.generic,
        message: result.data,
      );
    } on DioException catch (err, stackTrace) {
      _logger.e(
        'Error Log',
        error: err,
        stackTrace: stackTrace,
      );

      FailureType type = FailureType.generic;
      String message = err.toString();

      switch (err.response?.statusCode) {
        case 400:
          type = FailureType.badRequest;
          message = 'Invalid request.';
          break;
        case 401:
          type = FailureType.unauthorized;
          message = 'You are not authorized to access this route.';
          break;
        case 404:
          type = FailureType.notFound;
          message = 'Page not found.';
          break;
        case 405:
          type = FailureType.methodNotAllowed;
          message = 'Method not allowed for this route.';
          break;
        case 408:
          type = FailureType.requestTimeout;
          message = 'Request timeout.';
          break;
        case 409:
          type = FailureType.conflict;
          message = 'Conflict in the request.';
          break;
        case 429:
          type = FailureType.tooManyRequests;
          message = 'Too many requests being made.';
          break;
        case 500:
          type = FailureType.internalServerError;
          message = 'Internal server error.';
          break;
        case 503:
          type = FailureType.serviceUnavailable;
          message = 'Service temporarily unavailable.';
          break;
      }

      return Failure(
        type: type,
        message: message,
      );
    } catch (err, stackTrace) {
      _logger.e(
        'Error Log',
        error: err,
        stackTrace: stackTrace,
      );

      return Failure(
        type: FailureType.generic,
        message: err.toString(),
      );
    }
  }
}
