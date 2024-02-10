import 'package:flutter/material.dart';

class Settings {
  static String selectedSound = 'default_sound'; // Set a default sound

  static void changeSound(String newSound) {
    selectedSound = newSound;
  }
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<String> notificationSounds = [
    'default_sound',
    'assets/tones/sound1.mp3',

  ]; // List of available notification sounds

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[600],
        title: Text('Settings'),
      ),
      // body: ListView(
      //
      //   // children: notificationSounds
      //   //     .map((sound) => ListTile(
      //   //   title: Text(sound),
      //   //   onTap: () {
      //   //     setState(() {
      //   //       Settings.changeSound(sound);
      //   //     });
      //   //   },
      //   //   leading: Radio(
      //   //     value: sound,
      //   //     groupValue: Settings.selectedSound,
      //   //     onChanged: (value) {
      //   //       setState(() {
      //   //         Settings.changeSound(value.toString());
      //   //       });
      //   //     },
      //   //   ),
      //   // ))
      //   //     .toList(),
      // ),
    body: Container(
        color: const Color(0xFFFEF9E7),
        child: Column(
          children: [
            ListTile(
              title: Text('Dark mode',
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black54),),
              trailing: Switch(
                // value: appSettingsProvider.isDarkMode,
                // onChanged: (value) {
                //   appSettingsProvider.isDarkMode = value;
                //   themeProvider.toggleTheme();
                // },
                activeColor: Colors.brown[500], onChanged: (bool value) {  }, value: true,
              ),
            ),
            // Add notification tone and language settings here
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cuddleslider/widgets/theme_provider.dart';
// import 'package:cuddleslider/widgets/appsettings_provider.dart';
//
// class SettingsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     final appSettingsProvider = Provider.of<AppSettingsProvider>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.brown[600],
//         title: Text('Settings'),
//       ),
//       body: Container(
//         color: const Color(0xFFFEF9E7),
//         child: Column(
//           children: [
//             ListTile(
//               title: Text('Dark mode',
//               style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
//               trailing: Switch(
//                 // value: appSettingsProvider.isDarkMode,
//                 // onChanged: (value) {
//                 //   appSettingsProvider.isDarkMode = value;
//                 //   themeProvider.toggleTheme();
//                 // },
//                 activeColor: Colors.brown[500], onChanged: (bool value) {  }, value: true,
//               ),
//             ),
//             // Add notification tone and language settings here
//           ],
//         ),
//       ),
//     );
//   }
// }

