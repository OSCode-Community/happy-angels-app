import 'package:cloud_firestore/cloud_firestore.dart';

final userRef = FirebaseFirestore.instance.collection('users');
final taskRef = FirebaseFirestore.instance.collection('tasks');
