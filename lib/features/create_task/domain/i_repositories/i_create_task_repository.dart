import 'package:suai_coursework_frontend/features/home/data/entitiesDto/ui_task_dto.dart';

abstract interface class ICreateTaskRepository {
  Future<int> createTask(UiTaskDto task);

  Future<int> updateTask(UiTaskDto task);

  Future<int> deleteTask(int id);
}