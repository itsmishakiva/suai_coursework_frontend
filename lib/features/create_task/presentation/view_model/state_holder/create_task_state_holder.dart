import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suai_coursework_frontend/features/home/data/entitiesDto/ui_task_dto.dart';

final createTaskStateHolderProvider =
    StateNotifierProvider<CreateTaskStateHolder, UiTaskDto>(
  (ref) => CreateTaskStateHolder(
    UiTaskDto(
      title: '',
      statusId: 1,
    ),
  ),
);

class CreateTaskStateHolder extends StateNotifier<UiTaskDto> {
  CreateTaskStateHolder(super.state);

  void updateState(UiTaskDto? tasks) {
    if (tasks != null) {
      state = tasks;
    }
  }
}
