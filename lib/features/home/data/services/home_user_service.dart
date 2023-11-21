import 'package:dio/dio.dart';
import 'package:suai_coursework_frontend/features/home/data/entitiesDto/basic_user_dto.dart';
import 'package:suai_coursework_frontend/features/home/data/i_services/i_home_user_service.dart';

class HomeUserService implements IHomeUserService {
  final Dio _dio;

  HomeUserService(this._dio);

  @override
  Future<BasicUserDto> getMyUserInfo() async {
    try {
      final response = await _dio.get('/users/myself');
      return BasicUserDto.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<BasicUserDto>> getAllUsers() async {
    try {
      final response = await _dio.get('/users');
      List list = response.data;
      return list.map((e) => BasicUserDto.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
