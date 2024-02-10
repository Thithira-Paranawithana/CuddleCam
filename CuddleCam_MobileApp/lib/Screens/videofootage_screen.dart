import 'package:flutter/material.dart';
import '../widgets/play_video.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class VideoFootageScreen extends StatefulWidget {
  const VideoFootageScreen({Key? key}) : super(key: key);

  @override
  State<VideoFootageScreen> createState() => _VideoFootageScreenState();
}

class _VideoFootageScreenState extends State<VideoFootageScreen> {
  String url = 'http://192.168.1.250:3000/get_video';
  double? _progress;

  @override
  Widget build(BuildContext context) {
    _progress != null;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[600],
        title: Text('Video Footage'),
      ),
      body: Stack(// Use a Stack to layer the background image and the buttons
        children: [
          // Background image
          Image.asset(
            'assets/img14.jpeg',
            fit: BoxFit.cover, // Cover the entire screen
            width: double.infinity, // Match the screen width
            height: double.infinity, // Match the screen height
          ),
          // Centered buttons
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center vertically
              children: [
                ElevatedButton(
                  onPressed: () {
                    // download the most recent video footage to the gallery by pressing the button
                    FileDownloader.downloadFile(
                        url: url.trim(),
                        onProgress: (name, progress) {
                          setState(() {
                            _progress = progress;
                          });
                        },
                        onDownloadCompleted: (value) {
                          print('path  $value ');
                          setState(() {
                            _progress = null;
                          });
                        });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.brown[400], // Set the button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), // Set the button's border radius
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.center,
                    child: Text(
                      'Request Video',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to play the downloaded video
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlayVideo(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.brown[400], // Set the button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), // Set the button's border radius
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.center,
                    child: Text(
                      'Access Video',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
