import 'package:dio/dio.dart';
import 'package:suai_coursework_frontend/features/home/data/entitiesDto/task_group_dto.dart';
import 'package:suai_coursework_frontend/features/home/data/entitiesDto/task_status_dto.dart';
import 'package:suai_coursework_frontend/features/home/data/entitiesDto/task_type_dto.dart';
import 'package:suai_coursework_frontend/features/home/data/i_services/i_home_tasks_params_service.dart';

class HomeTasksParamsService implements IHomeTasksParamsService {
  final Dio _dio;
  
  HomeTasksParamsService(this._dio);
  
  @override
  Future<List<TaskGroupDto>> getAllGroups() async {
    try {
      final response = await _dio.get('/taskparams/groups');
      List list = response.data['groups'];
      return list.map((e) => TaskGroupDto.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TaskStatusDto>> getAllStatuses() async {
    try {
      final response = await _dio.get('/taskparams/statuses');
      List list = response.data['statuses'];
      return list.map((e) => TaskStatusDto.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TaskTypeDto>> getAllTypes() async {
    try {
      final response = await _dio.get('/taskparams/types');
      List list = response.data['types'];
      return list.map((e) => TaskTypeDto.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
