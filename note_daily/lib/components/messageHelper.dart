import 'package:flutter/material.dart';

class MessageHelper {
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showMessage(bool isSuccess, String message) {
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: isSuccess == true ? Colors.green : Colors.red,
        duration: Duration(seconds: 2),
        content: Text(
          message,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
