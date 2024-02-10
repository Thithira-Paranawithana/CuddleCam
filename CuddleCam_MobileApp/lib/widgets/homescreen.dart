import 'package:flutter/material.dart';
import 'package:cuddleslider/Screens/home.dart';
import 'package:cuddleslider/Screens/live_video.dart';
import 'package:cuddleslider/Screens/login.dart';
import 'package:cuddleslider/Screens/settings.dart';
import 'package:flutter/foundation.dart';
// import 'package:device_preview/device_preview.dart';
import 'package:cuddleslider/Screens/notifications.dart';
import 'package:cuddleslider/Screens/videofootage_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CuddleCam',

      // Routes for the functions
      routes: {
        '/home': (context) => const Home(),
        '/notifications': (context) => NotificationScreen(),
        '/login': (context) => const Login(),
        '/more': (context) => const VideoFootageScreen(),
        '/settings': (context) => SettingsScreen(),
        '/live_video': (context) => LiveVideoScreen(),
      },
      home: const Home(),
    );
  }
}


