import 'package:suai_coursework_frontend/features/home/data/repositories/home_tasks_repository.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task.dart';
import 'package:suai_coursework_frontend/features/home/domain/i_repositories/i_home_tasks_repository.dart';
import 'package:suai_coursework_frontend/features/home/presentation/i_use_cases/i_home_tasks_use_case.dart';

class HomeTasksUseCase implements IHomeTasksUseCase {
  IHomeTasksRepository homeTasksRepository = HomeTasksRepository();

  @override
  Future<List<Task>?> getTasks() async {
    try {
      final result = await homeTasksRepository.getTasks();
      return result;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
