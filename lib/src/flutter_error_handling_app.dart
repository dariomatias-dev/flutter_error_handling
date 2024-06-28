import 'package:flutter/material.dart';

import 'package:flutter_error_handling/src/core/routes/routes.dart';

class FlutterErrorHandlingApp extends StatelessWidget {
  const FlutterErrorHandlingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}
