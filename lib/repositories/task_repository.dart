import 'package:bloc_auth_app/constants/db_constants.dart';
import 'package:bloc_auth_app/models/custom_error_model.dart';
import 'package:bloc_auth_app/models/task_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskRepository {
  final FirebaseFirestore firebaseFirestore;
  TaskRepository({
    required this.firebaseFirestore,
  });

  Future<List<Task>> getAllTasks({required String sid}) async {
    try {
      List<Task> tasks = [];
      await taskRef
          .where("assignedTo", isEqualTo: sid)
          .get()
          .then((querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          tasks.add(Task.fromDoc(docSnapshot));
          print('${docSnapshot.id} => ${docSnapshot.data()}');
        }
        return tasks;
      });

      throw 'No tasks assigned';
    } on FirebaseException catch (e) {
      throw CustomError(
        code: e.code,
        message: e.message!,
        plugin: e.plugin,
      );
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<void> addTask({required Task task}) async {
    try {
      await taskRef.doc(task.tid).set({
        "tid": task.tid,
        "time": task.time,
        "title": task.title,
        "desc": task.desc,
        "completed": task.completed,
        "assignedBy": task.assignedBy,
        "assignedTo": task.assignedTo,
        "points": task.points,
      });
      print("Task added successfulyy");
    } on FirebaseException catch (e) {
      throw CustomError(
        code: e.code,
        message: e.message!,
        plugin: e.plugin,
      );
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }
}
