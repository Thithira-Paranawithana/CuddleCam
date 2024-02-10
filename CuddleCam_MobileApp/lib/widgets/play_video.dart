import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class PlayVideo extends StatefulWidget {
  const PlayVideo({Key? key}) : super(key: key);

  @override
  _PlayVideoState createState() => _PlayVideoState();
}

// Creating Video player screen with chewie player features
class _PlayVideoState extends State<PlayVideo> {
  late VideoPlayerController _videoPlayerController;
  File? _video;
  late ChewieController _chewieController;

  _pickVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      allowMultiple: false,
    );

    if (result != null && result.files.isNotEmpty) {
      File videoFile = File(result.files.first.path!);

      _videoPlayerController = VideoPlayerController.file(videoFile)
        ..initialize().then((_) {
          setState(() {});
          _chewieController = ChewieController(
            videoPlayerController: _videoPlayerController,
            autoPlay: true,
            looping: true,
          );
          _videoPlayerController.play();
        });
      setState(() {
        _video = videoFile;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(
      'assets/sample_video.mp4',
    )
      ..initialize().then((_) {
        setState(() {});
        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController,
          autoPlay: true,
          looping: true,
        );
        _videoPlayerController.play();
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
        backgroundColor: Colors.brown[600],
      ),
      body: Column(
        children: [
          if (_video != null || _videoPlayerController.value.isInitialized)
            Expanded( // Wrap Chewie in an Expanded widget
              child: Chewie(
                controller: _chewieController,
              ),
            )
          else
            Text(''),
          ElevatedButton(
            // Button to pick a video from the storage to play
            onPressed: _pickVideo,
            style: ElevatedButton.styleFrom(
              primary: Colors.brown[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.center,
              child: Text(
                'Pick Video From Gallery',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
