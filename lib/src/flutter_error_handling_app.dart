import 'package:flutter/material.dart';

import 'package:flutter_error_handling/src/screens/home_screen.dart';

class FlutterErrorHandlingApp extends StatelessWidget {
  const FlutterErrorHandlingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
