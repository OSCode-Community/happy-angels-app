// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:bloc_auth_app/models/task_model.dart';

part 'filtered_tasks_state.dart';

class FilteredTasksCubit extends Cubit<FilteredTasksState> {
  final List<Task> initialTasks;
  FilteredTasksCubit({
    required this.initialTasks,
  }) : super(FilteredTasksState(filteredTasks: initialTasks));

  void setFilteredTodos(Filter filter, List<Task> tasks, String searchTerm) {
    List<Task> filteredTasks;
    switch (filter) {
      case Filter.active:
        filteredTasks = tasks.where((Task todo) => !todo.completed).toList();
        break;
      case Filter.completed:
        filteredTasks = tasks.where((Task todo) => todo.completed).toList();
        break;
      case Filter.all:
      default:
        filteredTasks = tasks;
        break;
    }
    if (searchTerm.isNotEmpty) {
      filteredTasks = filteredTasks
          .where((Task todo) => todo.title.toLowerCase().contains(searchTerm))
          .toList();
    }
    emit(state.copyWith(filteredTasks: filteredTasks));
  }
}
