import 'package:suai_coursework_frontend/features/home/data/entitiesDto/task_group_dto.dart';
import 'package:suai_coursework_frontend/features/home/data/entitiesDto/task_status_dto.dart';
import 'package:suai_coursework_frontend/features/home/data/entitiesDto/task_type_dto.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task_group.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task_status.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task_type.dart';

abstract interface class ITaskParamsMapper {
  TaskStatus mapStatusToDto(TaskStatusDto taskStatusDto);

  TaskStatusDto mapStatusFromDto(TaskStatus taskStatus);

  TaskGroup mapGroupToDto(TaskGroupDto taskGroupDto);

  TaskGroupDto mapGroupFromDto(TaskGroup taskGroup);

  TaskType mapTypeToDto(TaskTypeDto taskTypeDto);

  TaskTypeDto mapTypeFromDto(TaskType taskType);
}
