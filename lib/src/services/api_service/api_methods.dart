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
    return await _callHandleRequest(
      _dio.get(
        options: Options(
          headers: headers,
        ),
        '$_baseUrl/$path',
      ),
    );
  }

  Future<Either> post(
    String path, {
    Map<String, dynamic>? headers,
    Object? data,
  }) async {
    return await _callHandleRequest(
      _dio.post(
        options: Options(
          headers: headers,
        ),
        '$_baseUrl/$path',
        data: data,
      ),
    );
  }

  Future<Either> patch(
    String path, {
    Map<String, dynamic>? headers,
    Object? data,
  }) async {
    return await _callHandleRequest(
      _dio.patch(
        options: Options(
          headers: headers,
        ),
        '$_baseUrl/$path',
        data: data,
      ),
    );
  }

  Future<Either> put(
    String path, {
    Map<String, dynamic>? headers,
    Object? data,
  }) async {
    return await _callHandleRequest(
      _dio.put(
        options: Options(
          headers: headers,
        ),
        '$_baseUrl/$path',
        data: data,
      ),
    );
  }

  Future<Either> delete(
    String path, {
    Map<String, dynamic>? headers,
  }) async {
    return await _callHandleRequest(
      _dio.delete(
        options: Options(
          headers: headers,
        ),
        '$_baseUrl/$path',
      ),
    );
  }

  Future<Either> _callHandleRequest(
    Future<Response<dynamic>> request,
  ) async {
    return _handleRequest(
      _logger,
      () async {
        return await request;
      },
    );
  }

  void close() {
    _dio.close();
    _logger.close();
  }
}
