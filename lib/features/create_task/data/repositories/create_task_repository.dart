import 'package:suai_coursework_frontend/config/data/dio_settings.dart';
import 'package:suai_coursework_frontend/features/create_task/data/i_services/i_create_task_service.dart';
import 'package:suai_coursework_frontend/features/create_task/data/services/create_task_service.dart';
import 'package:suai_coursework_frontend/features/create_task/domain/i_repositories/i_create_task_repository.dart';
import 'package:suai_coursework_frontend/features/home/data/entitiesDto/ui_task_dto.dart';

class CreateTaskRepository implements ICreateTaskRepository {
  final ICreateTaskService service =
      CreateTaskService(DioSettings.createBaseDio());

  @override
  Future<int> createTask(UiTaskDto task) async {
    final result = await service.createTask(task);
    return result;
  }

  @override
  Future<int> updateTask(UiTaskDto task) async {
    final result = await service.updateTask(task);
    return result;
  }

  @override
  Future<int> deleteTask(int id) async {
    final result = await service.deleteTask(id);
    return result;
  }
}
