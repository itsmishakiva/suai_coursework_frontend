import 'package:suai_coursework_frontend/features/home/domain/entities/basic_user.dart';

abstract interface class IHomeUserUseCase {
  Future<BasicUser?> getMyselfUser();

  Future<List<BasicUser>?> getAllUsers();
}
