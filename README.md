# Request Results Management in Flutter

This project introduces a custom solution for efficiently handling request results in Flutter applications. Leveraging the `Either` abstraction, the system elegantly manages both success and failure scenarios, allowing for detailed handling of each case. Additionally, it includes a robust global error management system to ensure a seamless user experience without interruptions.

## Requests

### Defining URLs

In `ApiService`, define the base URLs that will be used, using `http` in the same scheme as `http`:

```dart
class ApiService {
  static ApiMethods get http => ApiMethods(
        baseUrl: Urls.httpUrl,
      );
}
```

### Creating an Instance for Requests

Create an instance of `ApiService` calling the `get` method on the base URL of the requests:

```dart
static final _api = ApiService.http;
```

### HTTP Requests

To make requests, call the corresponding HTTP method as shown below:

```dart
final result = await _api.get('[path]');
```

If there is a header:

```dart
final result = await _api.get(
  '[path]',
  headers: <String, dynamic>{},
);
```

When there is a body:

```dart
final result = await _api.post(
  '[path]',
  headers: <String, dynamic>{},
  data: <String, dynamic>{},
);
```

</br>

## Handling Results

The result of the requests will be an instance of Either, which can be either a success or a failure. To handle the result, access the `handle` method, passing a function to obtain the current context, what to do when a success occurs, and what to do when a failure occurs:

```dart
result.handle(
  getContext: _getContext,
  success: (value) {},
  failure: (type, message, handleError) {},
);
```

When a failure occurs and you want the default handling to be performed, call the `handleError` function:

```dart
result.handle(
  getContext: _getContext,
  success: (value) {},
  failure: (type, message, handleError) {
    handleError();
  },
);
```

The default handling will only be applied when `handleError` is called, allowing for local handling as follows:

```dart
result.handle(
  getContext: _getContext,
  success: (value) {},
  failure: (type, message, handleError) {
    switch (type) {
      case FailureType.badGateway:
        // Local Error Handling
      default:
        handleError();
    }
  },
);
```
