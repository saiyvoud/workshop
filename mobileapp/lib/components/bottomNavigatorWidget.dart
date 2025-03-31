import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/components/barcodesimple.dart';
import 'package:mobileapp/view/home/home_view.dart';
import 'package:mobileapp/view/print/printer_view.dart';
import 'package:mobileapp/view/profile/profile_view.dart';
import 'package:mobileapp/view/search/search_view.dart';

class BottomNavigatorWidget extends StatefulWidget {
  const BottomNavigatorWidget({super.key});

  @override
  State<BottomNavigatorWidget> createState() => _BottomNavigatorWidgetState();
}

class _BottomNavigatorWidgetState extends State<BottomNavigatorWidget> {
  List<IconData> iconList = [
    Icons.home_outlined,
    Icons.search_outlined,
    Icons.print_rounded,
    Icons.person,
  ];
  List<Widget> _children = [
    HomeView(), // home
    SearchView(), // search
    PrintView(), // printer
    ProfileView() // profile
  ];
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_bottomNavIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BarcodeScannerSimple(),
            ),
          );
        },
        backgroundColor: Colors.white,
        child: Center(
          child: Icon(
            Icons.qr_code_scanner,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Colors.red.shade400,
        icons: iconList,
        activeColor: Colors.white,
        inactiveColor: Colors.white,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }
}
