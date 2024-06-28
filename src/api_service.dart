import 'either.dart';
import 'package:dio/dio.dart';

class ApiService {
  final _dio = Dio();

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

      if (result.statusCode == 200) {
        return Success(
          value: result.data,
        );
      }
    } catch (err) {}

    return Failure(
      type: FailureType.generic,
      message: '',
    );
  }
}
