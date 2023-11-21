import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suai_coursework_frontend/features/home/domain/use_cases/home_tasks_use_case.dart';
import 'package:suai_coursework_frontend/features/home/presentation/i_use_cases/i_home_tasks_use_case.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/state_holder/home_tasks_state_holder.dart';

final homeTasksControllerProvider = Provider<HomeTasksController>(
  (ref) => HomeTasksController(
    useCase: HomeTasksUseCase(),
    tasksStateHolder: ref.watch(homeTasksStateHolderProvider.notifier),
  ),
);

class HomeTasksController {
  final IHomeTasksUseCase useCase;
  final HomeTasksStateHolder tasksStateHolder;

  HomeTasksController({
    required this.useCase,
    required this.tasksStateHolder,
  });

  Future<void> getTasks() async {
    final result = await useCase.getTasks();
    if (result == null) {
      //TODO Error logic
      return;
    }
    tasksStateHolder.updateState(result);
  }
}
