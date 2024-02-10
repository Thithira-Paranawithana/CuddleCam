import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart'; // Import FlutterLocalNotificationsPlugin
import 'package:cuddleslider/welcome_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'Screens/notifications.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();
 // FlutterDownloader.initialize();

  // Initialize notifications
  await initializeNotifications();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,    // remove debug banner
    initialRoute: '/',
    routes: {
      '/': (context) => WelcomeScreen(),
      '/notify': (context) => NotificationScreen(),
    },
  ));
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin(); // Initialize the plugin

// Function to initialize notifications
Future<void> initializeNotifications() async {
  const AndroidInitializationSettings androidInitializationSettings =
  AndroidInitializationSettings('@mipmap/ic_launcher');
  final InitializationSettings initializationSettings =
  InitializationSettings(
    android: androidInitializationSettings,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}




