import 'package:flutter/material.dart';

class PrintView extends StatefulWidget {
  const PrintView({super.key});

  @override
  State<PrintView> createState() => _PrintViewState();
}

class _PrintViewState extends State<PrintView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 500,
        color: Colors.purple,
      ),
    );
  }
}