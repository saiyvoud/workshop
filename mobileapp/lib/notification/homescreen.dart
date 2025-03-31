import 'package:flutter/material.dart';
import 'package:mobileapp/notification/shownoti.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //show local notification flutter
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                ShowLocalNotification().scheduleNotification(
                    'Local Notification test',
                    'This is a local notification after 5 sec interval',
                    5);
              },
              child: Text('Show Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
