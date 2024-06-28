import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'package:flutter_error_handling/src/core/constants/urls.dart';
import 'package:flutter_error_handling/src/core/either/either.dart';

part 'api_methods.dart';

class ApiService {
  static ApiMethods get jsonPlaceholder => ApiMethods(
        baseUrl: Urls.jsonPlaceholderUrl,
      );

  static ApiMethods get openWeatherMap => ApiMethods(
        baseUrl: Urls.openWeatherMapUrl,
      );

  static ApiMethods get theDogApi => ApiMethods(
        baseUrl: Urls.theDogApiUrl,
      );
}
