// ignore_for_file: use_build_context_synchronously

import 'package:bloc_auth_app/blocs/auth/auth_bloc.dart';
import 'package:bloc_auth_app/models/meeting_details_model.dart';
import 'package:bloc_auth_app/pages/meeting/widgets/control_panel.dart';
import 'package:bloc_auth_app/pages/meeting/widgets/remore_connnection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter_webrtc_wrapper/flutter_webrtc_wrapper.dart';

class MeetingPage extends StatefulWidget {
  final String? meetingID;
  final String? name;
  final MeetingDetails meetingDetail;
  const MeetingPage(
      {super.key, this.meetingID, this.name, required this.meetingDetail});

  @override
  State<MeetingPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  final _localRenderer = RTCVideoRenderer();
  final Map<String, dynamic> mediaConstraints = {
    "audio": true,
    "video": true,
  };
  bool isConnectionFailed = false;
  WebRTCMeetingHelper? meetingHelper;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: _buildMeetingRoom(),
      bottomNavigationBar: ControlPanel(
        onAudioToggle: audioToggle,
        onVideoToggle: videoToggle,
        videoEnabled: isVideoEnabled(),
        audioEnable: isAudioEnabled(),
        isConnectionFailed: isConnectionFailed,
        onReconnect: handleReconnect,
        onMeetingEnd: onMeetingEnd,
      ),
    );
  }

  void startMeeting() async {
    final String userID = context.read<AuthBloc>().state.user!.uid;
    meetingHelper = WebRTCMeetingHelper(
      url: "http://www.example.com/",
      meetingId: 'testing',
      userId: userID,
      name: widget.name,
    );
    print("Connection:  ${meetingHelper!.connections}");

    MediaStream localStream =
        await navigator.mediaDevices.getUserMedia(mediaConstraints);
    _localRenderer.srcObject = localStream;
    meetingHelper!.stream = localStream;

    meetingHelper!.on(
      "open",
      context,
      ((ev, context) {
        setState(() {
          isConnectionFailed = false;
        });
      }),
    );
    meetingHelper!.on(
      "connection",
      context,
      ((ev, context) {
        setState(() {
          isConnectionFailed = false;
        });
      }),
    );
    meetingHelper!.on(
      "user-left",
      context,
      ((ev, context) {
        setState(() {
          isConnectionFailed = false;
        });
      }),
    );
    meetingHelper!.on(
      "video-toggle",
      context,
      ((ev, context) {
        setState(() {});
      }),
    );
    meetingHelper!.on(
      "audio-toggle",
      context,
      ((ev, context) {
        setState(() {});
      }),
    );
    meetingHelper!.on(
      "meeting-ended",
      context,
      ((ev, context) {
        onMeetingEnd();
      }),
    );
    meetingHelper!.on(
      "connection-setting-changed",
      context,
      ((ev, context) {
        setState(() {
          isConnectionFailed = false;
        });
      }),
    );
    meetingHelper!.on(
      "stream-changed",
      context,
      ((ev, context) {
        setState(() {
          isConnectionFailed = false;
        });
      }),
    );
    setState(() {});
  }

  initRenderers() async {
    await _localRenderer.initialize();
  }

  @override
  void initState() {
    super.initState();
    initRenderers();
    startMeeting();
  }

  @override
  void deactivate() {
    super.deactivate();
    _localRenderer.dispose();
    if (meetingHelper != null) {
      meetingHelper!.destroy();
      meetingHelper = null;
    }
  }

  void videoToggle() {
    if (meetingHelper != null) {
      setState(() {
        meetingHelper!.toggleVideo();
      });
    }
  }

  void audioToggle() {
    if (meetingHelper != null) {
      setState(() {
        meetingHelper!.toggleAudio();
      });
    }
  }

  bool isVideoEnabled() {
    return meetingHelper != null ? meetingHelper!.videoEnabled! : false;
  }

  bool isAudioEnabled() {
    return meetingHelper != null ? meetingHelper!.audioEnabled! : false;
  }

  void handleReconnect() {
    if (meetingHelper != null) {
      meetingHelper!.reconnect();
    }
  }

  void onMeetingEnd() {
    if (meetingHelper != null) {
      meetingHelper!.endMeeting();
      meetingHelper = null;
      goToHomePage();
    }
  }

  void goToHomePage() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  _buildMeetingRoom() {
    return Stack(
      children: [
        meetingHelper != null && meetingHelper!.connections.isNotEmpty
            ? GridView.count(
                crossAxisCount: meetingHelper!.connections.length < 3 ? 1 : 2,
                children:
                    List.generate(meetingHelper!.connections.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(1),
                    child: RemoteConnection(
                        renderer: meetingHelper!.connections[index].renderer,
                        connection: meetingHelper!.connections[index]),
                  );
                }),
              )
            : const Center(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Waiting for participants to join',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
        Positioned(
          bottom: 10,
          right: 0,
          child: SizedBox(
            width: 150,
            height: 200,
            child: RTCVideoView(_localRenderer),
          ),
        )
      ],
    );
  }
}
