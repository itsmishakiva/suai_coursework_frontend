import 'package:suai_coursework_frontend/features/create_task/data/repositories/create_task_repository.dart';
import 'package:suai_coursework_frontend/features/create_task/domain/i_repositories/i_create_task_repository.dart';
import 'package:suai_coursework_frontend/features/create_task/presentation/i_use_cases/i_create_task_use_case.dart';
import 'package:suai_coursework_frontend/features/home/data/entitiesDto/task_dto.dart';
import 'package:suai_coursework_frontend/features/home/data/entitiesDto/ui_task_dto.dart';

class CreateTaskUseCase implements ICreateTaskUseCase {
  final ICreateTaskRepository createTaskRepository = CreateTaskRepository();

  @override
  Future<bool> createTask(UiTaskDto taskDto) async {
    try {
      int value = await createTaskRepository.createTask(taskDto);
      if (value == 200) return true;
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteTask(int id) async {
    try {
      int value = await createTaskRepository.deleteTask(id);
      if (value == 200) return true;
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> updateTask(UiTaskDto taskDto) async {
    try {
      int value = await createTaskRepository.updateTask(taskDto);
      if (value == 200) return true;
      return false;
    } catch (e) {
      return false;
    }
  }
}
