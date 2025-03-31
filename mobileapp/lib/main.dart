// import 'package:flutter/material.dart';
// import 'package:mobileapp/components/bottomNavigatorWidget.dart';
// import 'package:mobileapp/components/messageHelper.dart';
// import 'package:mobileapp/multiWidget/column_widget.dart';
// import 'package:mobileapp/multiWidget/gridview_widget.dart';
// import 'package:mobileapp/multiWidget/listview_widget.dart';
// import 'package:mobileapp/multiWidget/row_widget.dart';
// import 'package:mobileapp/multiWidget/stack_widget.dart';
// import 'package:mobileapp/singleWidget/center_widget.dart';
// import 'package:mobileapp/singleWidget/container_widget.dart';
// import 'package:mobileapp/singleWidget/inkwell_widget.dart';
// import 'package:mobileapp/singleWidget/textButton_widget.dart';
// import 'package:mobileapp/singleWidget/textFormField_widget.dart';
// import 'package:mobileapp/view/auth/login_view.dart';
// import 'package:mobileapp/view/home/home_view.dart';

// void main() {
//   runApp(
//       MyApp()); // flutter ຈະຕ້ອງເວລາຄັ້ງ class ຈະຕ້ອງເປັນໂຕສະເຫນີໂຕແລກ ແລະ word ຕໍ່ກະຕ້ອງຂື້ນຕົ້ນດ້ວຍໂຕໃຫຍ່ເຊັນກັນ
// }

// class MyApp extends StatelessWidget {
//   // state less ແມ່ນ widget ທີ່ໃຊ້ໄວໃນການສ້າງ class ທີ່ບໍ່ມີການ ປ່ຽນແປງຄ່າບ່ອຍ ຫລື
//   // ບໍ່ມີການ render (setState) ຂໍ້ມູນ
//   // extends ແມ່ນການສຶບທອບ class
//   const MyApp({super.key}); // ເອີ້ນຄ່າ contruture ເປັນສ່ວນໃຊ້ພາຍໃນ class ນີ້

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       scaffoldMessengerKey: MessageHelper.scaffoldMessager,
//       home: BottomNavigatorWidget(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mobileapp/notification/homescreen.dart';
import 'package:timezone/data/latest_all.dart' as tz;
void main() {
  tz.initializeTimeZones();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homescreen(),
    );
  }
}
