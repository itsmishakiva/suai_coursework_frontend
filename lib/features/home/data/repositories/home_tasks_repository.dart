import 'package:suai_coursework_frontend/config/data/dio_settings.dart';
import 'package:suai_coursework_frontend/features/home/data/i_mappers/i_task_mapper.dart';
import 'package:suai_coursework_frontend/features/home/data/i_services/i_home_tasks_service.dart';
import 'package:suai_coursework_frontend/features/home/data/mappers/task_mapper.dart';
import 'package:suai_coursework_frontend/features/home/data/services/home_tasks_service.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task.dart';
import 'package:suai_coursework_frontend/features/home/domain/i_repositories/i_home_tasks_repository.dart';

class HomeTasksRepository implements IHomeTasksRepository {
  IHomeTasksService service = HomeTasksService(DioSettings.createBaseDio());
  ITaskMapper mapper = TaskMapper();

  @override
  Future<List<Task>> getTasks() async {
    final tasksDto = await service.getAllTasks();
    final tasks = tasksDto.map((e) => mapper.mapToDto(e)).toList();
    return tasks;
  }
}
