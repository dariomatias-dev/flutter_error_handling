# Request Management in Flutter

A custom solution offering efficient and flexible management of requests in Flutter applications. Based on the `Either` abstraction, it simplifies handling success and failure scenarios, enabling detailed and tailored management for each situation.

The solution supports both local management, where specific cases can be handled individually, and global management, which applies consistent rules across all cases. Additionally, a robust global error management system ensures a smooth and uninterrupted user experience, even in unexpected situations.

## Requests

### Defining URLs

In `ApiService`, define the base URLs that will be used, using `http` in the same scheme as `http`:

__Class with URLs:__
```dart
class Urls {
  static const httpUrl = 'https://dummyjson.com/http';
}
```

__Service Class:__
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

<br/>

## Autor

<img style="border-radius: 50%" src="https://raw.githubusercontent.com/dariomatias-dev/images/main/my_photo/my_photo.png" width="100px" alt="My photo"/>

<sub>
  <b>Dário Matias</b>
</sub>

<p>
  Solution developed for study and learning purposes, available under the MIT license.
</p>

<a href="https://www.linkedin.com/in/dariomatias-dev/" target="_blank">
  <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" />
</a>

<a href="https://www.instagram.com/dariomatias_dev/?theme=dark" target="_blank">
  <img src="https://img.shields.io/badge/-Instagram-%23E4405F?style=for-the-badge&logo=instagram&logoColor=white" />
</a>
