import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:visionfm/classess/video_class.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  final Video video;
  VideoPlayer({this.video});
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.video.id,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
  }

  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        onExitFullScreen: () {
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        },
        onEnterFullScreen: () {
          SystemChrome.setPreferredOrientations(
              [DeviceOrientation.landscapeLeft]);
        },
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          onReady: () {
            print('Player is ready');
          },
        ),
        builder: (context, player) {
          return Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text(
                  widget.video.title.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    letterSpacing: 1.2,
                    fontSize: 13.0,
                  ),
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: player,
                ),
              ],
            ),
          );
        });
  }
}
