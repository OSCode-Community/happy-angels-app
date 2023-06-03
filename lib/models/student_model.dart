// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Student extends Equatable {
  final String sid;
  final String name;
  final String email;
  final String birthday;
  final String phone;
  final String gender;
  final String subscriptionStatus;
  final String subscriptionDeadline;
  final int currentPoints;
  final int cumulativePoints;
  final String assignedAngel;
  final String address;
  // final String profileImage;

  Student({
    required this.sid,
    required this.name,
    required this.email,
    required this.birthday,
    required this.phone,
    required this.gender,
    required this.subscriptionStatus,
    required this.subscriptionDeadline,
    required this.currentPoints,
    required this.cumulativePoints,
    required this.assignedAngel,
    required this.address,
  });

  factory Student.fromDoc(DocumentSnapshot studentDoc) {
    final studentData = studentDoc.data() as Map<String, dynamic>?;
    return Student(
        sid: studentDoc.id,
        name: studentData!["name"],
        email: studentData["email"],
        birthday: studentData["birthday"],
        phone: studentData["phone"],
        gender: studentData["gender"],
        subscriptionStatus: studentData["subscriptionStatus"],
        subscriptionDeadline: studentData["subscriptionDeadline"],
        currentPoints: studentData["currentPoints"],
        cumulativePoints: studentData["cumulativePoints"],
        assignedAngel: studentData["assignedAngel"],
        address: studentData["address"]);
  }
  factory Student.initialUser() {
    return Student(
      sid: '',
      name: '',
      email: '',
      birthday: '',
      assignedAngel: '',
      cumulativePoints: -1,
      currentPoints: -1,
      gender: '',
      phone: '',
      subscriptionDeadline: '',
      subscriptionStatus: '',
      address: '',
    );
  }
  @override
  List<Object> get props {
    return [
      sid,
      name,
      email,
      birthday,
      phone,
      gender,
      subscriptionStatus,
      subscriptionDeadline,
      currentPoints,
      cumulativePoints,
      assignedAngel,
      address
    ];
  }

  @override
  bool get stringify => true;
}
