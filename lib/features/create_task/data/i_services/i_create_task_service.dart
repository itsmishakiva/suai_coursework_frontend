import 'package:suai_coursework_frontend/features/home/data/entitiesDto/task_dto.dart';
import 'package:suai_coursework_frontend/features/home/data/entitiesDto/ui_task_dto.dart';

abstract interface class ICreateTaskService {
  Future<int> createTask(UiTaskDto task);

  Future<int> updateTask(UiTaskDto task);

  Future<int> deleteTask(int id);
}