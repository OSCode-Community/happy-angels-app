class MeetingDetails {
  String? id;
  String? hostID;
  String? hostName;
  MeetingDetails({
    this.id,
    this.hostID,
    this.hostName,
  });

  factory MeetingDetails.fromJson(dynamic json) {
    return MeetingDetails(
      id: json["_id"],
      hostID: json["hostID"],
      hostName: json["hostName"],
    );
  }
}
