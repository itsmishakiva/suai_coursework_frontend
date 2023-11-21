import 'package:suai_coursework_frontend/features/home/data/repositories/home_tasks_params_repository.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task_group.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task_status.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task_type.dart';
import 'package:suai_coursework_frontend/features/home/domain/i_repositories/i_home_tasks_params_repository.dart';
import 'package:suai_coursework_frontend/features/home/presentation/i_use_cases/i_home_tasks_params_use_case.dart';

class HomeTasksParamsUseCase implements IHomeTasksParamsUseCase {
  IHomeTasksParamsRepository homeTasksParamsRepository = HomeTasksParamsRepository();

  @override
  Future<List<TaskGroup>?> getGroups() async {
    try {
      final result = await homeTasksParamsRepository.getGroups();
      return result;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<TaskStatus>?> getStatuses() async {
    try {
      final result = await homeTasksParamsRepository.getStatuses();
      return result;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<TaskType>?> getTypes() async {
    try {
      final result = await homeTasksParamsRepository.getTypes();
      return result;
    } catch (e) {
      return null;
    }
  }
}
