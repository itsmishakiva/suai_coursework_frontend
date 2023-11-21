import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suai_coursework_frontend/features/create_task/domain/use_cases/create_task_use_case.dart';
import 'package:suai_coursework_frontend/features/create_task/presentation/i_use_cases/i_create_task_use_case.dart';
import 'package:suai_coursework_frontend/features/create_task/presentation/view_model/state_holder/create_task_error_loading_state_holder.dart';
import 'package:suai_coursework_frontend/features/create_task/presentation/view_model/state_holder/create_task_loading_state_holder.dart';
import 'package:suai_coursework_frontend/features/create_task/presentation/view_model/state_holder/create_task_state_holder.dart';
import 'package:suai_coursework_frontend/features/home/data/entitiesDto/basic_user_dto.dart';
import 'package:suai_coursework_frontend/features/home/domain/use_cases/home_tasks_use_case.dart';
import 'package:suai_coursework_frontend/features/home/presentation/i_use_cases/i_home_tasks_use_case.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/controller/home_tasks_controller.dart';

final createTaskControllerProvider = Provider<CreateTaskController>(
  (ref) => CreateTaskController(
    useCase: CreateTaskUseCase(),
    homeTasksController: ref.watch(homeTasksControllerProvider),
    taskStateHolder: ref.watch(createTaskStateHolderProvider.notifier),
    createTaskLoadingStateHolder: ref.watch(createTaskLoadingStateHolderProvider.notifier),
    createTaskErrorLoadingStateHolder: ref.watch(createTaskErrorLoadingStateHolderProvider.notifier),
  ),
);

class CreateTaskController {
  final ICreateTaskUseCase useCase;
  final HomeTasksController homeTasksController;
  final CreateTaskStateHolder taskStateHolder;
  final CreateTaskLoadingStateHolder createTaskLoadingStateHolder;
  final CreateTaskErrorLoadingStateHolder createTaskErrorLoadingStateHolder;

  CreateTaskController({
    required this.useCase,
    required this.homeTasksController,
    required this.taskStateHolder,
    required this.createTaskLoadingStateHolder,
    required this.createTaskErrorLoadingStateHolder
  });

  Future<bool> createTask() async {
    createTaskLoadingStateHolder.updateState(true);
    bool value = await useCase.createTask(taskStateHolder.state!);
    await homeTasksController.getTasks();
    return value;
  }

  Future<bool> updateTask() async {
    createTaskLoadingStateHolder.updateState(true);
    bool value = await useCase.updateTask(taskStateHolder.state!);
    await homeTasksController.getTasks();
    return value;
  }

  Future<bool> deleteTask() async {
    createTaskErrorLoadingStateHolder.updateState(true);
    bool value = await useCase.deleteTask(taskStateHolder.state!.id!);
    await homeTasksController.getTasks();
    return value;
  }

  Future<void> updateParams({
    int? id,
    String? title,
    int? statusId,
    String? description,
    int? typeId,
    int? groupId,
    int? userId,
  }) async {
    var state = taskStateHolder.state;
    taskStateHolder.updateState(state?.copyWith(
      id: id,
      title: title,
      statusId: statusId,
      description: description,
      typeId: typeId,
      groupId: groupId,
      userId: userId,
    ));
  }
}
