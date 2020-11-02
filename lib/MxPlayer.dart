import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mx_player_plugin/mx_player_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';


class MxPlayer extends StatefulWidget {
  @override
  _MxPlayerState createState() => _MxPlayerState();
}

class _MxPlayerState extends State<MxPlayer> {
  String url="https://filesamples.com/samples/video/wmv/sample_2560x1440.wmv";
  _onpressed()async{
    await PlayerPlugin.openWithVlcPlayer(url);

  }
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          //initialUrl: "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/the_valley_compressed.mp4?raw=true",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      )
    );
  }
}
