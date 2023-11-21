import 'package:suai_coursework_frontend/config/data/dio_settings.dart';
import 'package:suai_coursework_frontend/features/home/data/i_mappers/i_basic_user_mapper.dart';
import 'package:suai_coursework_frontend/features/home/data/i_services/i_home_user_service.dart';
import 'package:suai_coursework_frontend/features/home/data/mappers/basic_user_mapper.dart';
import 'package:suai_coursework_frontend/features/home/data/services/home_user_service.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/basic_user.dart';
import 'package:suai_coursework_frontend/features/home/domain/i_repositories/i_home_user_repository.dart';

class HomeUserRepository implements IHomeUserRepository {
  IHomeUserService service = HomeUserService(DioSettings.createBaseDio());
  IBasicUserMapper mapper = BasicUserMapper();

  @override
  Future<BasicUser> getMyselfUser() async {
    final userDto = await service.getMyUserInfo();
    final user = mapper.mapToDto(userDto);
    return user;
  }
}
