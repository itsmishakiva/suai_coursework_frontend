import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suai_coursework_frontend/features/home/domain/use_cases/home_tasks_params_use_case.dart';
import 'package:suai_coursework_frontend/features/home/presentation/i_use_cases/i_home_tasks_params_use_case.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/state_holder/home_task_groups_state_holder.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/state_holder/home_task_statuses_state_holder.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/state_holder/home_task_types_state_holder.dart';

final homeTasksParamsControllerProvider = Provider<HomeTasksParamsController>(
  (ref) => HomeTasksParamsController(
    useCase: HomeTasksParamsUseCase(),
    taskTypesStateHolder: ref.watch(homeTasksTypesStateHolderProvider.notifier),
    taskStatusesStateHolder:
        ref.watch(homeTasksStatusesStateHolderProvider.notifier),
    taskGroupsStateHolder:
        ref.watch(homeTasksGroupsStateHolderProvider.notifier),
  ),
);

class HomeTasksParamsController {
  final IHomeTasksParamsUseCase useCase;
  final HomeTaskTypesStateHolder taskTypesStateHolder;
  final HomeTaskStatusesStateHolder taskStatusesStateHolder;
  final HomeTaskGroupsStateHolder taskGroupsStateHolder;

  HomeTasksParamsController({
    required this.useCase,
    required this.taskTypesStateHolder,
    required this.taskStatusesStateHolder,
    required this.taskGroupsStateHolder,
  });

  Future<void> _getTypes() async {
    final result = await useCase.getTypes();
    if (result == null) {
      //TODO Error logic
      return;
    }
    taskTypesStateHolder.updateState(result);
  }

  Future<void> _getStatuses() async {
    final result = await useCase.getStatuses();
    if (result == null) {
      //TODO Error logic
      return;
    }
    taskStatusesStateHolder.updateState(result);
  }

  Future<void> _getGroups() async {
    final result = await useCase.getGroups();
    if (result == null) {
      //TODO Error logic
      return;
    }
    taskGroupsStateHolder.updateState(result);
  }

  Future<void> getAllParams() async {
    await _getGroups();
    await _getStatuses();
    await _getTypes();
  }
}
