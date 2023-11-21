import 'package:suai_coursework_frontend/features/home/data/entitiesDto/task_dto.dart';
import 'package:suai_coursework_frontend/features/home/data/i_mappers/i_basic_user_mapper.dart';
import 'package:suai_coursework_frontend/features/home/data/i_mappers/i_task_mapper.dart';
import 'package:suai_coursework_frontend/features/home/data/mappers/basic_user_mapper.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task.dart';

class TaskMapper implements ITaskMapper {
  IBasicUserMapper userMapper = BasicUserMapper();

  @override
  TaskDto mapFromDto(Task task) {
    TaskDto taskDto = TaskDto(
      id: task.id,
      title: task.title,
      statusId: task.status,
      description: task.description,
      typeId: task.type,
      groupId: task.group,
      userDto: task.user == null
          ? null
          : userMapper.mapFromDto(
        task.user!,
      ),
    );
    return taskDto;
  }

  @override
  Task mapToDto(TaskDto taskDto) {
    Task task = Task(
      id: taskDto.id!,
      title: taskDto.title,
      status: taskDto.statusId,
      description: taskDto.description,
      type: taskDto.typeId,
      group: taskDto.groupId,
      user: taskDto.userDto == null
          ? null
          : userMapper.mapToDto(
              taskDto.userDto!,
            ),
    );
    return task;
  }
}
