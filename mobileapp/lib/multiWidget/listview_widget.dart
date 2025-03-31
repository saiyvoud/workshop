import 'package:flutter/material.dart';
import 'package:mobileapp/singleWidget/container_widget.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context,index){
        return ContainerWidget();
      },
      scrollDirection: Axis.horizontal,
      // children: [
      //   ContainerWidget(),
      //   ContainerWidget(),
      //   ContainerWidget(),
      //   ContainerWidget(),
      //   ContainerWidget(),
      //   ContainerWidget(),
      // ],
    );
  }
}
