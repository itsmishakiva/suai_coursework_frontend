import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task_group.dart';

final homeTasksGroupsStateHolderProvider =
    StateNotifierProvider<HomeTaskGroupsStateHolder, List<TaskGroup>?>(
  (ref) => HomeTaskGroupsStateHolder(null),
);

class HomeTaskGroupsStateHolder extends StateNotifier<List<TaskGroup>?> {
  HomeTaskGroupsStateHolder(super.state);

  void updateState(List<TaskGroup> groups) {
    state = groups;
  }
}
