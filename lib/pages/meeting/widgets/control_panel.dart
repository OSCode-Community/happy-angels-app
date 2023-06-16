import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel(
      {super.key,
      this.videoEnabled,
      this.audioEnable,
      this.isConnectionFailed,
      this.onVideoToggle,
      this.onAudioToggle,
      this.onReconnect,
      this.onMeetingEnd});

  final bool? videoEnabled;
  final bool? audioEnable;
  final bool? isConnectionFailed;
  final VoidCallback? onVideoToggle;
  final VoidCallback? onAudioToggle;
  final VoidCallback? onReconnect;
  final VoidCallback? onMeetingEnd;

  @override
  Widget build(BuildContext context) {
    List<Widget> buildControls() {
      if (!isConnectionFailed!) {
        return [
          IconButton(
            onPressed: onVideoToggle,
            icon: Icon(videoEnabled! ? Icons.videocam : Icons.videocam_off),
            color: Colors.white,
            iconSize: 32,
          ),
          IconButton(
            onPressed: onAudioToggle,
            icon: Icon(audioEnable! ? Icons.mic : Icons.mic_off),
            color: Colors.white,
            iconSize: 32,
          ),
          const SizedBox(
            width: 25,
          ),
          Container(
            width: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red,
            ),
            child: IconButton(
              onPressed: onMeetingEnd,
              icon: const Icon(
                Icons.call_end,
                color: Colors.white,
              ),
            ),
          )
        ];
      } else {
        return [
          FormHelper.submitButton(
            "Reconnect",
            onReconnect!,
            btnColor: Colors.red,
            borderRadius: 10,
            width: 200,
            height: 40,
          ),
        ];
      }
    }

    return Container(
      color: Colors.blueGrey[900],
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buildControls(),
      ),
    );
  }
}
