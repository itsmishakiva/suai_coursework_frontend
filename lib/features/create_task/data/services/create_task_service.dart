import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:suai_coursework_frontend/features/create_task/data/i_services/i_create_task_service.dart';
import 'package:suai_coursework_frontend/features/home/data/entitiesDto/task_dto.dart';
import 'package:suai_coursework_frontend/features/home/data/entitiesDto/ui_task_dto.dart';

class CreateTaskService implements ICreateTaskService {
  final Dio _dio;

  CreateTaskService(this._dio);

  @override
  Future<int> createTask(UiTaskDto task) async {
    try {
      var response = await _dio.post(
        '/tasks',
        data: jsonEncode(
          task.toJson(),
        ),
      );
      return response.statusCode ?? 400;
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> updateTask(UiTaskDto task) async {
    try {
      var response = await _dio.put(
        '/tasks/${task.id}',
        data: jsonEncode(
          task.toJson(),
        ),
      );
      return response.statusCode ?? 400;
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> deleteTask(int id) async {
    try {
      var response = await _dio.delete(
        '/tasks/${id}',
      );
      print(response.statusCode);
      return response.statusCode ?? 400;
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
