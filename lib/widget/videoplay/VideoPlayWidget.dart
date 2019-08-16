import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VideoPlayWidget();
  }
}

class _VideoPlayWidget extends State<VideoPlayWidget> {
  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController1 = VideoPlayerController.network(
        'https://v1.nsfile.com/tmp/0/176/76/351098976394674176.mp4');
    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController1,
        aspectRatio: 9 / 16,
        autoPlay: true,
        looping: true,
        showControls: false,);
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();

    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
        child: Center(
          child: Chewie(
            controller: _chewieController,
          ),
        ),
      ),
      FlatButton(
        onPressed: () {
          _chewieController.enterFullScreen();
        },
        child: Text('Fullscreen'),
      ),
    ]);
  }
}
