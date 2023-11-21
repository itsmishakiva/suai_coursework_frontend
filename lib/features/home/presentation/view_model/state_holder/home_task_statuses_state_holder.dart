import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task_status.dart';

final homeTasksStatusesStateHolderProvider =
StateNotifierProvider<HomeTaskStatusesStateHolder, List<TaskStatus>?>(
      (ref) => HomeTaskStatusesStateHolder(null),
);

class HomeTaskStatusesStateHolder extends StateNotifier<List<TaskStatus>?> {
  HomeTaskStatusesStateHolder(super.state);

  void updateState(List<TaskStatus> statuses) {
    state = statuses;
  }
}
