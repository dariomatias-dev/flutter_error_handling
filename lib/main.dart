import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter_error_handling/src/flutter_error_handling_app.dart';

Future<void> main() async {
  await dotenv.load(
    fileName: '.env',
  );

  runApp(
    const FlutterErrorHandlingApp(),
  );
}
