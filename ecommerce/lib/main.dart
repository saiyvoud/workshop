import 'package:ecommerce/components/bottomNavigatorWidget.dart';
import 'package:ecommerce/router/router.dart';
import 'package:ecommerce/view/splashScreen/splashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main (){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouterPath.generateRoute,
     // initialRoute: RouterPath.bottom,
      home: BottomNavigatorWidget(),
    );
  }
}