import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  var currentPosition = Duration(seconds: 0).obs;
  var videoDuration = Duration(seconds: 0).obs;
  updateCurrentPosition(VideoPlayerController controller) async {
    currentPosition.value = await controller.position;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
