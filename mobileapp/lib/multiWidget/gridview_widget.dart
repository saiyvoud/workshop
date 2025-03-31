import 'package:flutter/material.dart';
import 'package:mobileapp/singleWidget/container_widget.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemCount: 3,
      itemBuilder: (context,index){
        return  ContainerWidget();
      },
      // children: [
      //   ContainerWidget(),
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
