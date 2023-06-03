// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_list_cubit.dart';

abstract class TaskListState extends Equatable {
  const TaskListState();

  @override
  List<Object> get props => [];
}

class TaskListInitial extends TaskListState {}

class TaskListLoading extends TaskListState {}

class TaskListLoaded extends TaskListState {
  final List<Task> taskList;
  TaskListLoaded({
    required this.taskList,
  });
}

class TaskListError extends TaskListState {}
