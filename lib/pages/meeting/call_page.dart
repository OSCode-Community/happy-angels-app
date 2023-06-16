import 'package:bloc_auth_app/constants/meeting_constants.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatelessWidget {
  const CallPage(
      {Key? key,
      required this.callID,
      required this.username,
      required this.userId})
      : super(key: key);
  final String callID;
  final String username;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID:
          zego_app_id, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign:
          zego_app_sign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: userId,
      userName: username,
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
        ..onOnlySelfInRoom = (_) => Navigator.of(context).pop(),
    );
  }
}
