// Toast utilities for Flutter
//
// Migrated from src/lib/utils/toast.ts

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// Show a toast notification
Future<void> showToast(
  String title,
  String message, {
  int? timeout, // in milliseconds
  String? buttonText,
  VoidCallback? buttonAction,
  Color? backgroundColor,
}) async {
  // Simple toast (Fluttertoast does not support custom buttons natively)
  await Fluttertoast.showToast(
    msg: title.isNotEmpty ? '$title\n$message' : message,
    toastLength: timeout != null && timeout > 3500
        ? Toast.LENGTH_LONG
        : Toast.LENGTH_SHORT,
    backgroundColor: backgroundColor ?? Colors.black87,
    textColor: Colors.white,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: timeout != null ? (timeout ~/ 1000) : 2,
  );
  // For custom actions/buttons, use a custom overlay/snackbar in the UI layer.
}

/// Remove a specific toast (not supported by Fluttertoast, placeholder)
void removeToast(String id) {
  // Not supported by Fluttertoast; to implement, use a custom overlay/snackbar system.
}

/// Clear all toast notifications (not supported by Fluttertoast, placeholder)
void clearToasts() {
  Fluttertoast.cancel();
}
