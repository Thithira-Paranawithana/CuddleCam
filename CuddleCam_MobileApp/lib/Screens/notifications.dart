import 'package:cuddleslider/main.dart';
import 'package:cuddleslider/widgets/homescreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String connectionStatus = 'Connecting...';

  // List for the notifications
  List<Message> receivedMessages = [];

  @override
  void initState() {
    super.initState();
    _connectToServer();
    _checkConnectionStatus();
    _startMessagePolling();
  }

  // Function to connect to the Raspberry Pi using http GET.
  Future<void> _connectToServer() async {
    final response = await http.get(Uri.parse('http://192.168.1.250:3000/connect'));

    if (response.statusCode == 200) {
      print('Connected to Raspberry Pi');
    } else {
      print('Failed to connect to Raspberry Pi');
    }
  }

  // Current connectivity status
  Future<void> _checkConnectionStatus() async {
    final response = await http.get(Uri.parse('http://192.168.1.250:3000/heartbeat'));

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      if (jsonBody['status'] == 'connected') {
        setState(() {
          connectionStatus = 'Connected';
        });
      } else {
        setState(() {
          connectionStatus = 'Disconnected';
        });
      }
    } else {
      setState(() {
        connectionStatus = 'Failed to retrieve connection status';
      });
    }
  }

  Future<void> _startMessagePolling() async {
    while (true) {
      await _checkConnectionStatus();
      await _fetchNewMessage();
      print('Started');
      await Future.delayed(const Duration(seconds: 1)); // Poll every 1 seconds
    }
  }

  // Fetch notifications using http GET method
  Future<void> _fetchNewMessage() async {
    final response = await http.get(Uri.parse('http://192.168.1.250:3000/share_message'));

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body) as Map<String, dynamic>;
      final message = jsonBody['message'] as String;
      final timestamp = DateTime.now();

      setState(() {
        receivedMessages.add(Message(message: message, timestamp: timestamp));
      });

      // Show a notification
      showNotification(message, timestamp);

    } else {
      setState(() {
        receivedMessages.add(Message(
          message: 'Failed to retrieve the message',
          timestamp: DateTime.now(),
        ));
      });
    }
  }

  // Show notifications with timestamp
  void showNotification(String message, DateTime timestamp) async {
    var android = AndroidNotificationDetails(
        'channel_id', 'channel_name', channelDescription: 'channel_description',
        priority: Priority.high, importance: Importance.max);
    var platform = NotificationDetails(android: android);
    var scheduledNotificationDateTime = DateTime.now();
    await flutterLocalNotificationsPlugin.show(
      0,
      'New Notification',
      message,
      platform,
      payload: 'Default_Sound',
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown[600],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // return to the HomeScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
          ),
          title: const Text('Notifications'),
          actions: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: _buildConnectionStatusIndicator(),
                ),

                // Icon button for a pop-up menu to connect/disconnect
                PopupMenuButton<String>(
                  icon: const Icon(Icons.notifications),
                  onSelected: _handleMenuOptionSelected,
                  itemBuilder: (context) => [
                    const PopupMenuItem<String>(
                      value: 'connect',
                      child: Text('Connect'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'disconnect',
                      child: Text('Disconnect'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'help',
                      child: Text('Help'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: receivedMessages.length,
          itemBuilder: (context, index) {
            final message = receivedMessages[index];
            return ListTile(
              title: Text(message.message),
              subtitle: Text(message.timestamp.toString()),
            );
          },
        ),
      ),
    );
  }

  // Display the connection status using colors
  Widget _buildConnectionStatusIndicator() {
    Color color;
    switch (connectionStatus) {
      case 'Connected':
        color = Colors.green;
        break;
      case 'Connecting...':
        color = Colors.yellow;
        break;
      case 'Disconnected':
        color = Colors.red;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      width: 12.0,
      height: 12.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  // Connect to or Disconnect from Raspberry Pi
  void _handleMenuOptionSelected(String value) async {
    switch (value) {
      case 'connect':
        final response = await http.get(Uri.parse('http://192.168.1.250:3000/connect'));
        if (response.statusCode == 200) {
          setState(() {
            connectionStatus = 'Connected';
          });
        } else {
          // Handle error case
        }
        break;
      case 'disconnect':
        final response = await http.get(Uri.parse('http://192.168.1.250:3000/disconnect'));
        if (response.statusCode == 200) {
          setState(() {
            connectionStatus = 'Connected';
          });
        } else {
          // Handle error case
        }
        // Handle disconnect option
        break;
      case 'help':
      // Handle help option
        break;
    }
  }
}

class Message {
  final String message;
  final DateTime timestamp;

  Message({required this.message, required this.timestamp});
}


