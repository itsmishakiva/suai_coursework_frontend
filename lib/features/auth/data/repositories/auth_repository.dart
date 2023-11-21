import 'package:hive/hive.dart';
import 'package:suai_coursework_frontend/config/data/dio_settings.dart';
import 'package:suai_coursework_frontend/features/auth/data/i_services/i_auth_service.dart';
import 'package:suai_coursework_frontend/features/auth/data/services/auth_service.dart';
import 'package:suai_coursework_frontend/features/auth/domain/i_repositories/i_auth_repository.dart';

class AuthRepository implements IAuthRepository {
  final IAuthService _service = AuthService(DioSettings.createAuthDio());

  @override
  Future<void> auth(String username, String password) async {
    String result = await _service.auth(username, password);
    final box = Hive.box('auth');
    box.put('token', result);
    return;
  }

  @override
  Future<void> signup(String username, String password) async {
    String result = await _service.signUp(username, password);
    final box = Hive.box('auth');
    box.put('token', result);
    return;
  }

}
