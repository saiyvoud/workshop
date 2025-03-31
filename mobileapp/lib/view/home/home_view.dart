import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/components/data.dart';
import 'package:mobileapp/view/home/widget/app_homeview.dart';
import 'package:mobileapp/view/home/widget/product_body.dart';
import 'package:mobileapp/view/home/widget/search_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: appbarHomeView(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBody(),
            ProductBody(),
          ],
        ),
      ),
     
    );
  }
}
