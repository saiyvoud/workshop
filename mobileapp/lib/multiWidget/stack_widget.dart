import 'package:flutter/material.dart';
import 'package:mobileapp/singleWidget/container_widget.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 150,
          left: 20,
          child: ContainerWidget(),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: ContainerWidget(),
        ),
      ],
    );
  }
}
