# Results Management in Flutter

A custom solution offering efficient and flexible management of outcomes in Flutter applications. Based on the `Either` abstraction, it simplifies handling success and failure scenarios, enabling detailed and tailored management for each situation.  

The solution supports both local handling, where specific cases can be managed individually, and global handling, which applies consistent rules across all cases. Additionally, a robust global error management system ensures a smooth and uninterrupted user experience, even in unexpected situations.

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
final _api = ApiService.http;
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
await result.handle(
  getContext: _getContext,
  success: (value) {},
  failure: (type, message, handleError) async {},
);
```

When a failure occurs and you want the default handling to be performed, call the `handleError` function:

```dart
await result.handle(
  getContext: _getContext,
  success: (value) {},
  failure: (type, message, handleError) async {
    await handleError();
  },
);
```

The default handling will only be applied when `handleError` is called, allowing for local handling as follows:

```dart
await result.handle(
  getContext: _getContext,
  success: (value) {},
  failure: (type, message, handleError) async {
    switch (type) {
      case FailureType.badGateway:
        // Local Error Handling
      default:
        await handleError();
    }
  },
);
```
