import 'package:flutter/material.dart';

class UserManualScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Manual'),
        backgroundColor: Colors.brown[600],
      ),
      body: Container(
        color: const Color(0xFFFEF9E7),
        child: ListView(
          children: [
            ListTile(
              title: Text(
                'Hello, welcome to the CuddleCam User Manual...',
                style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text(
                '* Click on background of every screen to access it.\n\n * Check the connection state in notifications screen.\n\n * Do not close the app. Make it run in the background.\n\n * Keep the mobile connected to your wifi network',
                style: TextStyle(color: Colors.black54),
              ),
            ),
            // Add more pointwise text here
          ],
        ),
      ),
    );
  }
}