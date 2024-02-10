import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppSettingsProvider with ChangeNotifier {
  bool isDarkMode = false;
  String notificationTone = 'default'; // Replace with your notification tone logic
  String languageCode = 'en'; // Replace with your language logic
}
