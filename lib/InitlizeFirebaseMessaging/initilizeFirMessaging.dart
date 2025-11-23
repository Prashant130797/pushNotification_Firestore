import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';

class Initilizefirmessaging {
  Initilizefirmessaging._initFmessaging();
  static final Initilizefirmessaging firebaseMessagingInstance =
      Initilizefirmessaging._initFmessaging();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  initFCM() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    final apns = await _firebaseMessaging.getAPNSToken();
    print("APNs Token: $apns");

    final fcmToken = await _firebaseMessaging.getToken();
    print("the fcm token is $fcmToken");

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print("the event onMessageOpenedApp ${event.notification?.title}");
    });

    FirebaseMessaging.onMessage.listen((event) {
      print("the event onMessage ${event.notification?.title}");
    });

    FirebaseMessaging.onBackgroundMessage((message) async {
      print("the event onMessage ${message.notification?.title}");
    });
  }

  // Future<void> requestPermission()async{
  //    await _firebaseMessaging.requestPermission();
  //   final fcmToken = await _firebaseMessaging.getToken();
  //   print("the fcm token is $fcmToken");
  // }
}
