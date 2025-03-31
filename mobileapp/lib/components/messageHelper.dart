import 'package:flutter/material.dart';

class MessageHelper {
  static GlobalKey<ScaffoldMessengerState> scaffoldMessager =
      GlobalKey<ScaffoldMessengerState>();
  static showMessageBar(bool isSuccess, String message) {
    scaffoldMessager.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: isSuccess == true ? Colors.green : Colors.red, 
     
        content: Text(
          message,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
