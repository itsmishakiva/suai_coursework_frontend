import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:suai_coursework_frontend/features/auth/data/i_services/i_auth_service.dart';

class AuthService implements IAuthService {
  final Dio _dio;

  const AuthService(this._dio);

  @override
  Future<String> auth(String username, String password) async {
    try {
      var response = await _dio.post(
        '/auth',
        data: jsonEncode(
          {
            'username': username,
            'password': password,
          },
        ),
      );
      if (response.statusCode == 200) {
        return response.data['accessToken'];
      }
      throw Exception();
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> signUp(String username, String password) async {
    try {
      var response = await _dio.post(
        '/signup',
        data: jsonEncode(
          {
            'username': username,
            'password': password,
          },
        ),
      );
      return response.data['accessToken'];
    } on DioException catch (e) {
      print(e);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
