import 'package:cuddleslider/Screens/user_manual.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cuddleslider/Screens/notifications.dart';
import 'live_video.dart';
import 'videofootage_screen.dart';
import 'settings.dart';


class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<String> captureVideoStream() async {
    final response = await http.get(Uri.parse('http://192.168.1.250:8000/stream'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to capture video stream');
    }
  }
  int _currentIndex = 0;

  // Creating a Tab list for the functions
  late List<Widget> tabs;

  @override
  void initState() {
    super.initState();

    // Tab design
    tabs = [
      Container(
        color: Color(0xFFFEF9E7),

        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: InkWell(
                  onTap: () {
                    // Navigate to the NotificationScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationScreen(),
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/pics/pic8.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        color: Color(0xFFFEF9E7),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: InkWell(
                  onTap: () {
                    // Navigate to the Live Video Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  LiveVideoScreen(),
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/images/img.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        color: Color(0xFFFEF9E7),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: InkWell(
                  onTap: () {
                    // Navigate to the Video footage Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VideoFootageScreen(),
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/pics/pics1.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        color: Color(0xFFFEF9E7),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsScreen(), // Navigate to Settings page
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/pics/pics2.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown[600],
          elevation: 0,
          centerTitle: true,
          title: const Text('CuddleCam'),
          leading: Builder(
            builder: (BuildContext context) {
              // Icon button to open the drawer menu
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
          ],
        ),

        // Drawer for app title, image, user manual and contact details
        drawer: Drawer(
          child: Container(
            color: Color.fromARGB(255, 242, 222, 199),
            child: Column(
              children: [
                Container(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      CircleAvatar(
                        radius: 50, // Adjust the size of the CircleAvatar
                        backgroundColor: Colors.white, // Background color behind the image
                        child: CircleAvatar(
                          radius: 48, // Adjust the size of the image
                          backgroundImage: AssetImage('assets/icon1.jpg'),
                        ),
                      ),
                      SizedBox(height: 10), // Adjust the spacing between the CircleAvatar and the title
                      Text(
                        'CuddleCam',
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.brown, // Text color set to brown
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(height: 20),
                      ListTile(
                        leading: Icon(Icons.menu_book),
                        title: GestureDetector(
                          onTap: () {
                            // Navigate to the user manual
                            Navigator.push(context, MaterialPageRoute(builder: (context) => UserManualScreen()));
                          },
                          child: Text(
                            'User Manual',
                            style: TextStyle(fontSize: 20, color: Colors.brown),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text(
                          'Contact us',
                          style: TextStyle(fontSize: 20, color: Colors.brown),
                        ),
                      ),
                    ],

                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        'copyright © 2023 • CuddleCam',
                        style: TextStyle(
                          fontSize: 16, // Adjust the font size
                          color: Colors.brown, // Text color set to brown
                        ),
                      ),
                      Text(
                        'All Rights Reserved',
                        style: TextStyle(
                          fontSize: 14, // Adjust the font size
                          color: Colors.brown, // Text color set to brown
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),


        body: tabs[_currentIndex],
        backgroundColor: Colors.brown[500],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.videocam),
              label: 'Live video',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_collection),
              label: 'Recordings',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.yellowAccent,
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}



