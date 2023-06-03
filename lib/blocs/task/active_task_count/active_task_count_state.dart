// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'active_task_count_cubit.dart';

class ActiveTaskCountState extends Equatable {
  final int activeTaskCount;
  ActiveTaskCountState({
    required this.activeTaskCount,
  });

  factory ActiveTaskCountState.initial() {
    return ActiveTaskCountState(activeTaskCount: 0);
  }

  @override
  List<Object> get props => [activeTaskCount];

  @override
  bool get stringify => true;

  ActiveTaskCountState copyWith({
    int? activeTaskCount,
  }) {
    return ActiveTaskCountState(
      activeTaskCount: activeTaskCount ?? this.activeTaskCount,
    );
  }
}
