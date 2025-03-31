import 'package:flutter/material.dart';

class LoadingHepler {
   static Loading (context){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        backgroundColor: Colors.transparent,
        content: Container(
          height: 50,
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    });
   }
}