import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task.dart';

final homeTasksStateHolderProvider =
StateNotifierProvider<HomeTasksStateHolder, List<Task>?>(
      (ref) => HomeTasksStateHolder(null),
);

class HomeTasksStateHolder extends StateNotifier<List<Task>?> {
  HomeTasksStateHolder(super.state);

  void updateState(List<Task> tasks) {
    state = tasks;
  }
}
