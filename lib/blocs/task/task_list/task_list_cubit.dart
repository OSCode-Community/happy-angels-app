// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:bloc_auth_app/models/custom_error_model.dart';
import 'package:equatable/equatable.dart';

import 'package:bloc_auth_app/models/task_model.dart';
import 'package:bloc_auth_app/repositories/task_repository.dart';

part 'task_list_state.dart';

class TaskListCubit extends Cubit<TaskListState> {
  final TaskRepository taskRepository;
  TaskListCubit({
    required this.taskRepository,
  }) : super(TaskListInitial());

  Future<void> getAllTasks({required String sid}) async {
    emit(TaskListLoading());
    try {
      List<Task> tasks = await taskRepository.getAllTasks(sid: sid);
      emit(TaskListLoaded(taskList: tasks));
    } on CustomError catch (e) {
      emit(TaskListError());
    }
  }
}
