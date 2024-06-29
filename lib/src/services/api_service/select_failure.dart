part of 'api_service.dart';

Failure _selectFailure(
  DioException err,
) {
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
    case 403:
      type = FailureType.forbidden;
      message = 'Access to this resource is forbidden.';
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
    case 502:
      type = FailureType.badGateway;
      message = 'Bad gateway.';
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
}
