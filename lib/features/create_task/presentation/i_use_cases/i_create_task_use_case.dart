import 'package:suai_coursework_frontend/features/home/data/entitiesDto/task_dto.dart';
import 'package:suai_coursework_frontend/features/home/data/entitiesDto/ui_task_dto.dart';

abstract interface class ICreateTaskUseCase {
  Future<bool> createTask(UiTaskDto taskDto);

  Future<bool> updateTask(UiTaskDto taskDto);

  Future<bool> deleteTask(int id);
}