// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:js';

import 'package:http/http.dart' as http;

String MEETING_API_URL = "http://10.0.2.2:4000/api/meeting";

var client = http.Client();

Future<http.Response?> startMeeting(userId) async {
  Map<String, String> requestHeaders = {
    'Content-Type': 'application/json',
  };
  var userID = userId;

  var response = await client.post(
    Uri.parse('$MEETING_API_URL/start'),
    headers: requestHeaders,
    body: jsonEncode({
      'hostID': userID,
      'hostName': '',
    }),
  );
  if (response.statusCode == 200) {
    return response;
  } else {
    return null;
  }
}

Future<http.Response> joinMeeting(String meetingID) async {
  var response =
      await http.get(Uri.parse('$MEETING_API_URL/join?meetingID=$meetingID'));
  if (response.statusCode >= 200 && response.statusCode < 400) return response;
  throw UnsupportedError("Not valid meeting");
}
