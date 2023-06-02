// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Angel extends Equatable {
  final String aid;
  final String name;
  final String email;
  final String phoneNumber;
  final String birthday;
  final String profession;
  final String gender;
  final String quote;
  // final String profileImage;
  final List<String> assignedStudents;
  Angel({
    required this.aid,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.birthday,
    required this.profession,
    required this.gender,
    required this.quote,
    required this.assignedStudents,
  });

  factory Angel.fromDoc(DocumentSnapshot angelDoc) {
    final angelData = angelDoc.data() as Map<String, dynamic>?;
    return Angel(
      aid: angelDoc.id,
      name: angelData!["name"],
      email: angelData["email"],
      phoneNumber: angelData["phoneNumber"],
      birthday: angelData["birthday"],
      profession: angelData["profession"],
      gender: angelData["gender"],
      quote: angelData["quote"],
      assignedStudents: angelData["assignedStudents"],
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      aid,
      name,
      email,
      phoneNumber,
      birthday,
      profession,
      gender,
      quote,
      assignedStudents,
    ];
  }
}
