import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  var link="https://filesamples.com/samples/video/wmv/sample_2560x1440.wmv";
 // VlcPlayerController _videoViewController;
  VideoPlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState

    try{
      _controller = VideoPlayerController.network(
          link)
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        });
      _controller.addListener(() {
        if (_controller.value.hasError) {
          print("motger    choooooood");
          print(_controller.value.errorDescription);
        }
        if (_controller.value.initialized) {}
        if (_controller.value.isBuffering) {}
      });
    }
    catch(e){
      print(" $e");
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: _controller.value.initialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),

    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}
