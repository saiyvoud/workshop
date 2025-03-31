import 'package:flutter/material.dart';
import 'package:mobileapp/singleWidget/container_widget.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,// ປັບຕາມລວງຕັ້ງ
        crossAxisAlignment: CrossAxisAlignment.start, // ປັບຕາມລວງນອນ
        children: [
          ContainerWidget(),
          Text("test"),
          ContainerWidget(),
          ContainerWidget(),
           ContainerWidget(),
          Text("test"),
          ContainerWidget(),
          ContainerWidget(),
           ContainerWidget(),
          Text("test"),
          ContainerWidget(),
          ContainerWidget(),
           ContainerWidget(),
          Text("test"),
          ContainerWidget(),
          ContainerWidget(),
           ContainerWidget(),
          Text("test"),
          ContainerWidget(),
          ContainerWidget(),
           ContainerWidget(),
          Text("test"),
          ContainerWidget(),
          ContainerWidget(),
           ContainerWidget(),
          Text("test"),
          ContainerWidget(),
          ContainerWidget(),
           ContainerWidget(),
          Text("test"),
          ContainerWidget(),
          ContainerWidget(),
        ],
      ),
    );
  }
}
