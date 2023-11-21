import 'package:suai_coursework_frontend/features/home/data/entitiesDto/task_dto.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task.dart';

abstract interface class ITaskMapper {
  Task mapToDto(TaskDto taskDto);

  TaskDto mapFromDto(Task task);
}