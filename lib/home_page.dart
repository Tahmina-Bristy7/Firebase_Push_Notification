import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_notification/main.dart';
import 'package:firebase_notification/noti.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    init();
    super.initState();
  }

  init() async {
    String deviceToken = await getDeviceToken();
    print("########### PRINT DEVICE TOKEN FOR PUSH NOTIFICATION #############");
    print("deviceToken=$deviceToken");
    print("########################");
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage remoteMessage) {
      String? title = remoteMessage.notification!.title;
      String? description = remoteMessage.notification!.body;

      Alert(
        context: context,
        type: AlertType.error,
        title: title,
        desc: description,
        buttons: [
          DialogButton(
            child: Text(
              "COOL",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  // Noti.showBigTextNotification(
                  //     title: "Message Title",
                  //     body: "Your Message Body",
                  //     fln: flutterLocalNotificationsPlugin);
                },
                child: Text(" CLick "))),
      ),
    );
  }

  Future getDeviceToken() async {
    FirebaseMessaging _firebaseMessage = await FirebaseMessaging.instance;
    String? deviceToken = await _firebaseMessage.getToken();
    return (deviceToken == null) ? "" : deviceToken;
  }
}
