// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'active_task_count_state.dart';

class ActiveTaskCountCubit extends Cubit<ActiveTaskCountState> {
  final int initialActiveTasksCount;
  ActiveTaskCountCubit({
    required this.initialActiveTasksCount,
  }) : super(ActiveTaskCountState(activeTaskCount: initialActiveTasksCount));

  void calculateActiveTaskCount(int activeTaskCount) {
    emit(state.copyWith(activeTaskCount: activeTaskCount));
  }
}
