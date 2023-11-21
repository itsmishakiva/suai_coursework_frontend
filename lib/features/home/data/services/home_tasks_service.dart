import 'package:dio/dio.dart';
import 'package:suai_coursework_frontend/features/home/data/entitiesDto/task_dto.dart';
import 'package:suai_coursework_frontend/features/home/data/i_services/i_home_tasks_service.dart';

class HomeTasksService implements IHomeTasksService {
  final Dio _dio;

  HomeTasksService(this._dio);

  @override
  Future<List<TaskDto>> getAllTasks() async {
    try {
      final response = await _dio.get('/tasks');
      List list = response.data['tasks'];
      return list.map((e) => TaskDto.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}