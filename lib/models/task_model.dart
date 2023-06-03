import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Task extends Equatable {
  final String tid;
  final String time;
  final String title;
  final String desc;
  final String status;
  final String assignedBy; // angel id
  final String assignedTo; // student id
  final bool sentPoints;
  final int points;
  Task({
    required this.tid,
    required this.time,
    required this.title,
    required this.desc,
    required this.status,
    required this.assignedBy,
    required this.assignedTo,
    required this.sentPoints,
    required this.points,
  });

  factory Task.fromDoc(DocumentSnapshot taskDoc) {
    final taskData = taskDoc.data() as Map<String, dynamic>?;
    return Task(
      tid: taskDoc.id,
      time: taskData!["time"],
      title: taskData["title"],
      desc: taskData["desc"],
      status: taskData["status"],
      assignedBy: taskData["assignedBy"],
      assignedTo: taskData["assignedTo"],
      sentPoints: taskData["sentPoints"],
      points: taskData["points"],
    );
  }

  @override
  List<Object> get props {
    return [
      tid,
      time,
      title,
      desc,
      status,
      assignedBy,
      assignedTo,
      sentPoints,
      points,
    ];
  }
}
