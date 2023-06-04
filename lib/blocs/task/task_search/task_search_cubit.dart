import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'task_search_state.dart';

class TaskSearchCubit extends Cubit<TaskSearchState> {
  TaskSearchCubit() : super(TaskSearchState.initial());

  void setSearchTerm(String newSearchterm) {
    emit(state.copyWith(searchTerm: newSearchterm));
  }
}
