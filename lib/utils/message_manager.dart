import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../logic/blocs/notification_bloc/notification_bloc.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title : ${message.notification?.title}');
  print('Body : ${message.notification?.body}');
  print('Payload : ${message.data}');
}

Future<void> handleForegroundMessage(RemoteMessage message) async {
  print('Title : ${message.notification?.title}');
  print('Body : ${message.notification?.body}');
  print('Payload : ${message.data}');
}

class MessageManager {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  static final NotificationBloc _notificationBloc = NotificationBloc();
  static NotificationBloc get notificationBloc => _notificationBloc;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print(fCMToken);

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _notificationBloc.add(SendNotification(title: message.notification?.title, message: message.notification?.body));
      handleForegroundMessage(message);
    });
  }
}