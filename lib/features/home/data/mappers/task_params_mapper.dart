import 'package:flutter/material.dart';
import 'package:suai_coursework_frontend/features/home/data/entitiesDto/task_group_dto.dart';
import 'package:suai_coursework_frontend/features/home/data/entitiesDto/task_status_dto.dart';
import 'package:suai_coursework_frontend/features/home/data/entitiesDto/task_type_dto.dart';
import 'package:suai_coursework_frontend/features/home/data/i_mappers/i_task_params_mapper.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task_group.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task_status.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task_type.dart';

class TaskParamsMapper implements ITaskParamsMapper {
  @override
  TaskGroupDto mapGroupFromDto(TaskGroup taskGroup) {
    TaskGroupDto taskGroupDto = TaskGroupDto(
      id: taskGroup.id,
      label: taskGroup.label,
      color: taskGroup.color.value,
    );
    return taskGroupDto;
  }

  @override
  TaskGroup mapGroupToDto(TaskGroupDto taskGroupDto) {
    TaskGroup taskGroup = TaskGroup(
      id: taskGroupDto.id,
      label: taskGroupDto.label,
      color: Color(taskGroupDto.color),
    );
    return taskGroup;
  }

  @override
  TaskStatusDto mapStatusFromDto(TaskStatus taskStatus) {
    TaskStatusDto taskStatusDto = TaskStatusDto(
      id: taskStatus.id,
      label: taskStatus.label,
    );
    return taskStatusDto;
  }

  @override
  TaskStatus mapStatusToDto(TaskStatusDto taskStatusDto) {
    TaskStatus taskStatus = TaskStatus(
      id: taskStatusDto.id,
      label: taskStatusDto.label,
    );
    return taskStatus;
  }

  @override
  TaskTypeDto mapTypeFromDto(TaskType taskType) {
    TaskTypeDto taskTypeDto = TaskTypeDto(
      id: taskType.id,
      label: taskType.label,
      color: taskType.color.value,
    );
    return taskTypeDto;
  }

  @override
  TaskType mapTypeToDto(TaskTypeDto taskTypeDto) {
    TaskType taskType = TaskType(
      id: taskTypeDto.id,
      label: taskTypeDto.label,
      color: Color(taskTypeDto.color),
    );
    return taskType;
  }
}
