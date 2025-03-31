import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class ShowLocalNotification {
  // Declare the plugin as a field so it's initialized only once
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  
  // Constructor - initialize things here
  ShowLocalNotification() {
    tz.initializeTimeZones(); // Initialize timezones
  }

  // Check and request permission for exact alarms (Android 12+)
  Future<bool> checkAndRequestExactAlarmPermission() async {
    final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
        flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
            
    if (androidImplementation == null) return false;
    
    final bool? canScheduleExactNotifications = 
        await androidImplementation.canScheduleExactNotifications();
        
    if (canScheduleExactNotifications == false) {
      // This opens system settings for the user to grant permission
      await androidImplementation.requestExactAlarmsPermission();
      return false; // Return false since we don't know if user granted permission yet
    }
    
    return true;
  }
  
  // Schedule notification with permission check
  Future<void> scheduleNotification(String title, String body, int time) async {
    print("start");
    
    // First check/request permission
    bool hasPermission = await checkAndRequestExactAlarmPermission();
    
    var android = AndroidNotificationDetails(
      'channel id', 
      'channel NAME',
      priority: Priority.high, 
      importance: Importance.max,
      ongoing: true,
    );
    
    var platform = NotificationDetails(
      android: android,
    );
    
    // Choose schedule mode based on permission
    AndroidScheduleMode scheduleMode = hasPermission 
        ? AndroidScheduleMode.exactAllowWhileIdle 
        : AndroidScheduleMode.inexactAllowWhileIdle;
   
       
        
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      tz.TZDateTime.now(tz.local).add(Duration(seconds: time)),
      platform,
      uiLocalNotificationDateInterpretation: 
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: scheduleMode
    );
    
    print("Notification scheduled");
  }

}