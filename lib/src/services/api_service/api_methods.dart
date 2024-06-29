part of 'api_service.dart';

class ApiMethods {
  ApiMethods({
    required String baseUrl,
  }) : _baseUrl = baseUrl;

  final String _baseUrl;

  final _dio = Dio();
  final _logger = Logger();

  Future<Either> get(
    String path, {
    Map<String, dynamic>? headers,
  }) async {
    return _handleRequest(
      _logger,
      () async {
        return await _dio.get('$_baseUrl/$path');
      },
    );
  }

  Future<Either> post(
    String path, {
    Map<String, dynamic>? headers,
  }) async {
    return _handleRequest(
      _logger,
      () async {
        return await _dio.post('$_baseUrl/$path');
      },
    );
  }

  Future<Either> patch(
    String path, {
    Map<String, dynamic>? headers,
  }) async {
    return _handleRequest(
      _logger,
      () async {
        return await _dio.patch('$_baseUrl/$path');
      },
    );
  }

  Future<Either> put(
    String path, {
    Map<String, dynamic>? headers,
  }) async {
    return _handleRequest(
      _logger,
      () async {
        return await _dio.put('$_baseUrl/$path');
      },
    );
  }

  Future<Either> delete(
    String path, {
    Map<String, dynamic>? headers,
  }) async {
    return _handleRequest(
      _logger,
      () async {
        return await _dio.delete('$_baseUrl/$path');
      },
    );
  }
}
