part of 'filtered_tasks_cubit.dart';

class FilteredTasksState extends Equatable {
  final List<Task> filteredTasks;
  const FilteredTasksState({
    required this.filteredTasks,
  });

  factory FilteredTasksState.initial() {
    return const FilteredTasksState(filteredTasks: []);
  }

  @override
  List<Object> get props => [filteredTasks];

  @override
  bool get stringify => true;

  FilteredTasksState copyWith({
    List<Task>? filteredTasks,
  }) {
    return FilteredTasksState(
      filteredTasks: filteredTasks ?? this.filteredTasks,
    );
  }
}
