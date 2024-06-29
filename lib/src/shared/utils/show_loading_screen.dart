import 'dart:async';

import 'package:flutter/material.dart';

Future<void> showLoadingScreen(
  BuildContext context,
  Future<void> Function() request,
) async {
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) {
      return Container(
        color: Colors.black.withOpacity(0.8),
        constraints: const BoxConstraints.expand(),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    },
  );

  Overlay.of(context).insert(overlayEntry);

  await request();

  overlayEntry.remove();
}
