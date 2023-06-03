part of 'task_filter_cubit.dart';

class TaskFilterState extends Equatable {
  final Filter filter;
  const TaskFilterState({
    required this.filter,
  });

  factory TaskFilterState.initial() {
    return const TaskFilterState(filter: Filter.all);
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [filter];

  TaskFilterState copyWith({
    Filter? filter,
  }) {
    return TaskFilterState(
      filter: filter ?? this.filter,
    );
  }
}
