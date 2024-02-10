import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LiveVideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[600],
        title: Text("Live Video"),
      ),
      body: WebView(
        initialUrl: 'http://192.168.1.250:3000/video_feed', // URL to access live video
        javascriptMode: JavascriptMode.unrestricted, // Ensure correct capitalization
      ),
    );
  }
}



