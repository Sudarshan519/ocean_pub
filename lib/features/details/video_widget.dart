import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:publication_app/models/video.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  final VideoApi video;
  const VideoPage({Key key, this.video}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  VideoPlayerController _controller;
  Duration time;
  Duration currentPosition;
  var isPlaying = false;
  bool _disposed = false;
  Duration _duration;
  Duration _position;
  var _progress = 0.0;
  // final remained = max(0, duration - head);
  max(int a, int b) {
    return b > a ? b : a;
  }

  @override
  void initState() {
    initVideo();
    // TODO: implement initState
    super.initState();
  }

  findLength() {}

  initVideo() async {
    var controller =
        VideoPlayerController.network(widget.video.data.video.videoUrl);
    final oldController = _controller;
    if (oldController != null) {
      oldController.removeListener(onControllerUpdate);
      oldController.pause();
    }
    setState(() {});
    controller
      ..initialize().then((value) {
        if (oldController != null) oldController.dispose();

        _duration = _controller.value.duration;

        // print(_duration.toString() + "====>");
        controller.addListener(onControllerUpdate);
        controller.play();

        setState(() {});
      });
    _controller = controller;

    setState(() {});
    // if (_controller.value.isInitialized) _controller.play();
    // isPlaying = true;
  }

  var _onUpdateControllerTime;
  onControllerUpdate() async {
    if (_disposed) {
      return;
    }
    _onUpdateControllerTime = 0;

    final now = DateTime.now().microsecondsSinceEpoch;
    if (_onUpdateControllerTime > now) {
      return;
    }
    _onUpdateControllerTime = now + 500;
    final controller = _controller;
    if (controller == null) {
      debugPrint("controller is null");
      return;
    }
    if (!controller.value.isInitialized) {
      debugPrint("controller cannot be initialized");
    }
    if (_duration == null) return;
    var position = await controller.position;
    // print(position);
    _position = position ?? 0.seconds;
    final playing = controller.value.isPlaying;
    isPlaying = playing;
    if (playing) {
      if (_disposed) return;
      setState(() {
        _progress = position.inMilliseconds.ceilToDouble();
      });
      // print(position);
    }
  }

  @override
  void dispose() {
    _disposed = true;
    _controller.pause();
    _controller.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.video.data.video.videoUrl);
    return !_controller.value.isInitialized
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Column(children: [
                    AspectRatio(
                        aspectRatio: 16 / 9, child: VideoPlayer(_controller))
                  ]),
                  Center(
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Stack(
              //   children: [
              //     // Container(
              //     //   decoration: BoxDecoration(
              //     //       color: Colors.red, shape: BoxShape.circle),
              //     //   height: 25,
              //     //   width: 25,
              //     // ),
              //     SizedBox(
              //         height: 20,
              //         child: VideoProgressIndicator(_controller,
              //             allowScrubbing: true)),
              //   ],
              // ),
              _controlView(context),
            ],
          );
  }

  Widget _controlView(context) {
    final noMute = (_controller.value.volume ?? 0) > 0;
    final duration = _duration.inSeconds ?? 0;
    final head = _position.inSeconds ?? 0;
    final remained = max(0, duration - head);
    final mins = convertTwo(remained ~/ 60);
    final secs = convertTwo(remained % 60);
    print(_position);
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                if (noMute)
                  _controller.setVolume(0);
                else {
                  _controller.setVolume(1);
                }
                setState(() {});
              },
              icon: Icon(
                noMute ? Icons.volume_up : Icons.volume_off,
              )),
          IconButton(
              onPressed: () {
                _controller.seekTo(_position - 5.seconds);

                setState(() {});
              },
              icon: Icon(
                Icons.fast_rewind,
              )),
          IconButton(
              onPressed: () {
                if (isPlaying) {
                  _controller.pause();
                  isPlaying = false;
                } else {
                  _controller.play();
                  isPlaying = true;
                }

                setState(() {});
              },
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                size: 30,
              )),
          IconButton(
              onPressed: () {
                _controller.seekTo(_position + 5.seconds);

                setState(() {});
              },
              icon: Icon(Icons.fast_forward)),
          // Text(remained.toString()),
          Text(mins + ":"),
          Text(secs)
        ],
      ),
    );
  }

  convertTwo(value) {
    return value < 10 ? "0$value" : "$value";
  }
}

// class CurrentPosition extends StatefulWidget {
//   final VideoPlayerController controller;
//   const CurrentPosition({Key key, this.controller}) : super(key: key);

//   @override
//   State<CurrentPosition> createState() => _CurrentPositionState();
// }

// class _CurrentPositionState extends State<CurrentPosition> {
//   Duration currentPosition;

//   getPosition() async {
//     currentPosition = await widget.controller.position;
//   }

//   @override
//   void initState() {
//     playPause();
//     // TODO: implement initState
//     super.initState();
//   }

//   playPause() {
//     Timer.periodic(1.seconds, (timer) {
//       if (widget.controller.value.duration < currentPosition) {
//         getPosition();
//       } else {
//         timer.cancel();
//       }
//       setState(() {});
//     });
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     getPosition();
//     return Container(
//       child: Text(currentPosition.toString()),
//     );
//   }
// }