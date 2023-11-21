import 'package:dio/dio.dart';
import 'package:suai_coursework_frontend/features/auth/data/repositories/auth_repository.dart';
import 'package:suai_coursework_frontend/features/auth/domain/i_repositories/i_auth_repository.dart';
import 'package:suai_coursework_frontend/features/auth/presentation/i_use_cases/i_auth_use_case.dart';

class AuthUseCase implements IAuthUseCase {
  final IAuthRepository _repository = AuthRepository();

  @override
  Future<String?> auth(String username, String password) async {
    if (username.length < 5) return 'Неверные учетные данные';
    if (password.length < 5) return 'Неверные учетные данные';
    try {
      await _repository.auth(username, password);
      return null;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) return 'Неверные учетные данные';
      return 'Не удалось войти';
    } catch (e) {
      return 'Не удалось войти';
    }
  }

  @override
  Future<String?> signup(String username, String password,
      String repeatPassword) async {
    if (username.length < 5) {
      return 'Имя пользователя должно содержать не менее 5 символов';
    }
    if (password.length < 5) {
      return 'Пароль должен содержать не менее 5 символов';
    }
    if (password != repeatPassword) return 'Пароли не совпадают';
    try {
      await _repository.signup(username, password);
      return null;
    } catch (e) {
      return 'Не удалось войти';
    }
  }
}
