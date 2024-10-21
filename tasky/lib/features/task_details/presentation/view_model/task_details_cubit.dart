import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_repo.dart';
import '../../data/repos/task_details_repo.dart';
part 'task_details_state.dart';

class TaskDetailsCubit extends Cubit<TaskDetailsState> {
  final TaskDetailsRepo _taskDetailsRepo;
  TaskDetailsCubit(this._taskDetailsRepo) : super(TaskDetailsInitial());
  static TaskDetailsCubit get(context) => BlocProvider.of(context);

  void getTodoById(String id) async {
    emit(TaskDetailsLoadingState());
    final response = await _taskDetailsRepo.getTodoById(id);
    response.fold(
      (error) => emit(TaskDetailsErrorState(error)),
      (todoResponse) => emit(TaskDetailsSuccessState(todoResponse)),
    );
  }
}
