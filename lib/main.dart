import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dart_example/views/shopping_page.dart';
import 'package:flutter/material.dart';

//Nasir Ahmad Noori: Software Developer/ Flutter/Dart
void main() {
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: 'shopping_notifications',
      channelName: 'Shopping Notification',
      channelDescription: 'Shopping Notifications for this app',
    )
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ShoppingPage(),
    );
  }
}
