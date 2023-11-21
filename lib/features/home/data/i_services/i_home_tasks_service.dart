import 'package:suai_coursework_frontend/features/home/data/entitiesDto/task_dto.dart';

abstract interface class IHomeTasksService {
  Future<List<TaskDto>> getAllTasks();
}