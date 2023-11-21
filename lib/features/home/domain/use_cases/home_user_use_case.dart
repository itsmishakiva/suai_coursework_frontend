import 'package:suai_coursework_frontend/features/home/data/repositories/home_user_repository.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/basic_user.dart';
import 'package:suai_coursework_frontend/features/home/domain/i_repositories/i_home_user_repository.dart';
import 'package:suai_coursework_frontend/features/home/presentation/i_use_cases/i_home_user_use_case.dart';

class HomeUserUseCase implements IHomeUserUseCase {
  IHomeUserRepository homeUserRepository = HomeUserRepository();

  @override
  Future<BasicUser?> getMyselfUser() async {
    try {
      final result = await homeUserRepository.getMyselfUser();
      return result;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<BasicUser>?> getAllUsers() async {
    try {
      final result = await homeUserRepository.getUsers();
      return result;
    } catch (e) {
      return null;
    }
  }
}
