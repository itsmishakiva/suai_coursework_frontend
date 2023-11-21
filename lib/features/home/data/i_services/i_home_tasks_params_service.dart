import 'package:suai_coursework_frontend/features/home/data/entitiesDto/task_group_dto.dart';
import 'package:suai_coursework_frontend/features/home/data/entitiesDto/task_status_dto.dart';
import 'package:suai_coursework_frontend/features/home/data/entitiesDto/task_type_dto.dart';

abstract interface class IHomeTasksParamsService {
  Future<List<TaskTypeDto>> getAllTypes();

  Future<List<TaskGroupDto>> getAllGroups();

  Future<List<TaskStatusDto>> getAllStatuses();
}
