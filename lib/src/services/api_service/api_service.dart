import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'package:flutter_error_handling/src/core/constants/urls.dart';
import 'package:flutter_error_handling/src/core/either/either.dart';

part 'api_methods.dart';
part 'select_failure.dart';
part 'handle_request.dart';

class ApiService {
  static ApiMethods get http => ApiMethods(
        baseUrl: Urls.httpUrl,
      );
}
