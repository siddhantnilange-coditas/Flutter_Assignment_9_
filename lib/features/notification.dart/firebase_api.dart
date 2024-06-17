import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
      'high_importance_channel', 'High Importance Notifications',
      description: 'This channel is used for high importance notification',
      importance: Importance.high);

  final _localNotifications = FlutterLocalNotificationsPlugin();

  
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fcMToken = await _firebaseMessaging.getToken();
    print('Token------------------------ : ${fcMToken}');

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    print('Title : ${message.notification?.title}');
    print('Body : ${message.notification?.body}');
    print('Payload : ${message.data}');
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  
  }
}
