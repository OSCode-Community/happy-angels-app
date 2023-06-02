// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class StudentDetails extends Equatable {
  final String sid;
  final String school;
  final List<String> hobbies;
  final Double height;
  final Double weight;
  final String favFood;
  final List<String> activities;
  final List<String> courses;
  final List<String> additional_courses;
  // Additional questions

  StudentDetails({
    required this.sid,
    required this.school,
    required this.hobbies,
    required this.height,
    required this.weight,
    required this.favFood,
    required this.activities,
    required this.courses,
    required this.additional_courses,
  });

  factory StudentDetails.fromDoc(DocumentSnapshot studentDetailsDoc) {
    final studentDetailData = studentDetailsDoc.data() as Map<String, dynamic>?;
    return StudentDetails(
      sid: studentDetailsDoc.id,
      school: studentDetailData!["school"],
      hobbies: studentDetailData["hobbies"],
      height: studentDetailData["height"],
      weight: studentDetailData["weight"],
      favFood: studentDetailData["favFood"],
      activities: studentDetailData["activities"],
      courses: studentDetailData["courses"],
      additional_courses: studentDetailData["additional_courses"],
    );
  }

  @override
  List<Object> get props {
    return [
      sid,
      school,
      hobbies,
      height,
      weight,
      favFood,
      activities,
      courses,
      additional_courses,
    ];
  }
}
