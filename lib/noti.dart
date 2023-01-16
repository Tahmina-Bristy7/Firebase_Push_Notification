import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Noti {
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitilize = AndroidInitializationSettings('mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: androidInitilize);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future showBigTextNotification(
      {var id = 0,
      required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidNotificationSpecififies =
        const AndroidNotificationDetails(
            'You_can_name_it_whatener1', 'channel_name',
            playSound: true,
            sound: RawResourceAndroidNotificationSound('Notification'),
            importance: Importance.max,
            priority: Priority.high);
    var not = NotificationDetails(android: androidNotificationSpecififies);
    await fln.show(0, title, body, not);
  }
}
