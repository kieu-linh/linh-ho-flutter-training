
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key, this.linkVideo});
  final String? linkVideo;

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.linkVideo ?? ''))
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          })
          ..play();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      child: Center(
        child: videoPlayerController.value.isInitialized
            ? AspectRatio(
                aspectRatio: videoPlayerController.value.aspectRatio,
                child: VideoPlayer(videoPlayerController),
              )
            : Container(
                color: Colors.amber,
              ),
      ),
    );
  }
}
