import 'package:suai_coursework_frontend/config/data/dio_settings.dart';
import 'package:suai_coursework_frontend/features/home/data/i_mappers/i_task_params_mapper.dart';
import 'package:suai_coursework_frontend/features/home/data/i_services/i_home_tasks_params_service.dart';
import 'package:suai_coursework_frontend/features/home/data/mappers/task_params_mapper.dart';
import 'package:suai_coursework_frontend/features/home/data/services/home_tasks_params_service.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task_group.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task_status.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task_type.dart';
import 'package:suai_coursework_frontend/features/home/domain/i_repositories/i_home_tasks_params_repository.dart';

class HomeTasksParamsRepository implements IHomeTasksParamsRepository {
  IHomeTasksParamsService service = HomeTasksParamsService(DioSettings.createBaseDio());
  ITaskParamsMapper mapper = TaskParamsMapper();

  @override
  Future<List<TaskGroup>> getGroups() async {
    final groupsDto = await service.getAllGroups();
    final groups = groupsDto.map((e) => mapper.mapGroupToDto(e)).toList();
    return groups;
  }

  @override
  Future<List<TaskStatus>> getStatuses() async {
    final statusesDto = await service.getAllStatuses();
    final statuses = statusesDto.map((e) => mapper.mapStatusToDto(e)).toList();
    return statuses;
  }

  @override
  Future<List<TaskType>> getTypes() async {
    final typesDto = await service.getAllTypes();
    final types = typesDto.map((e) => mapper.mapTypeToDto(e)).toList();
    return types;
  }

}
