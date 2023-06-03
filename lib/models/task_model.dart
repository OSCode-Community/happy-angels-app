import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

enum Filter { all, active, completed }

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Task extends Equatable {
  final String tid;
  final String time;
  final String title;
  final String desc;
  final bool completed;
  final String assignedBy; // angel id
  final String assignedTo; // student id
  final bool sentPoints;
  final int points;
  Task({
    required this.tid,
    required this.time,
    required this.title,
    required this.desc,
    required this.completed,
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
      completed: taskData["completed"],
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
      completed,
      assignedBy,
      assignedTo,
      sentPoints,
      points,
    ];
  }
}
