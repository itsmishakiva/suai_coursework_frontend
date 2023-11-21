import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task_type.dart';

final homeTasksTypesStateHolderProvider =
StateNotifierProvider<HomeTaskTypesStateHolder, List<TaskType>?>(
      (ref) => HomeTaskTypesStateHolder(null),
);

class HomeTaskTypesStateHolder extends StateNotifier<List<TaskType>?> {
  HomeTaskTypesStateHolder(super.state);

  void updateState(List<TaskType> types) {
    state = types;
  }
}
