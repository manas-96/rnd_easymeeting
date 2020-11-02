import 'package:demo/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class VlcVideo extends StatefulWidget {
  @override
  _VlcVideoState createState() => _VlcVideoState();
}

class _VlcVideoState extends State<VlcVideo> {
  VlcPlayerController _videoViewController;
  var link="https://filesamples.com/samples/video/wmv/sample_2560x1440.wmv";
  final String urlToStreamVideo = 'http://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_1080p_60fps_normal.mp4';

  pause(){
    _videoViewController.pause();
  }
  play(){
    _videoViewController.play();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoViewController = new VlcPlayerController(onInit: () {
      print(_videoViewController.playingState.toString());

      _videoViewController.play();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Streaming"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              child: VlcPlayer(
                aspectRatio: 16 / 9,
                url: mockData["items"][0]["trailer_url"],
                controller: _videoViewController,
                placeholder: Center(child: CircularProgressIndicator()),
              ),
            ),
            
          ],
        ),
      ),
    );

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoViewController.dispose();
  }
}
