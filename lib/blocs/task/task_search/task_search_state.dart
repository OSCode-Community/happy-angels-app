part of 'task_search_cubit.dart';

class TaskSearchState extends Equatable {
  final String searchTerm;
  const TaskSearchState({
    required this.searchTerm,
  });

  factory TaskSearchState.initial() {
    return const TaskSearchState(searchTerm: '');
  }

  @override
  List<Object> get props => [searchTerm];

  TaskSearchState copyWith({
    String? searchTerm,
  }) {
    return TaskSearchState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }

  @override
  bool get stringify => true;
}
