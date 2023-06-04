import 'package:bloc/bloc.dart';
import 'package:bloc_auth_app/models/task_model.dart';
import 'package:equatable/equatable.dart';

part 'task_filter_state.dart';

class TaskFilterCubit extends Cubit<TaskFilterState> {
  TaskFilterCubit() : super(TaskFilterState.initial());

  void changeFilter(Filter newFilter) {
    emit(state.copyWith(filter: newFilter));
  }
}
