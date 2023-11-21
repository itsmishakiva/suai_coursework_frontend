import 'package:suai_coursework_frontend/features/home/data/entitiesDto/basic_user_dto.dart';

abstract interface class IHomeUserService {
  Future<BasicUserDto> getMyUserInfo();

  Future<List<BasicUserDto>> getAllUsers();
}