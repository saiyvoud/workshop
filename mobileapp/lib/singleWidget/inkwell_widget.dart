import 'package:flutter/material.dart';

class InkWellWidget extends StatelessWidget {
  const InkWellWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("okk");
      },
      child: Center(
        child: Text("data"),
      ),
    );
  }
}
