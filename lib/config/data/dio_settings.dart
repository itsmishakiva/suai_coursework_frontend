import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class DioSettings {
  static const String baseUrl = 'http://192.168.0.101:8080/api';
  static const String authUrl = 'http://192.168.0.101:8080/api/auth';

  final BaseOptions _dioAuthOptions = BaseOptions(
    baseUrl: authUrl,
    connectTimeout: const Duration(seconds: 60),
    followRedirects: true,
    maxRedirects: 10,
    validateStatus: (status) {
      return status != null && status <= 500;
    },
  );

  final BaseOptions _dioBaseOptions = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 60),
    followRedirects: true,
    maxRedirects: 10,
    validateStatus: (status) {
      return status != null && status <= 500;
    },
  );

  static Dio createAuthDio(
      {Duration connectTimeout = const Duration(seconds: 60)}) {
    Dio dio = Dio(
      DioSettings()._getDioAuthOptions(connectTimeout: connectTimeout),
    );

    return dio;
  }

  static Dio createBaseDio(
      {Duration connectTimeout = const Duration(seconds: 60)}) {
    Dio dio = Dio(
      DioSettings()._getDioBaseOptions(connectTimeout: connectTimeout),
    );

    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (options, handler) async {
          var box = Hive.box('auth');
          String token = box.get('token');
          options.headers['Authorization'] = 'Bearer $token';
          handler.next(options);
        },
      ),
    );

    return dio;
  }

  BaseOptions _getDioAuthOptions(
      {Duration connectTimeout = const Duration(seconds: 60)}) {
    var options = _dioAuthOptions;
    options.connectTimeout = connectTimeout;
    options.receiveTimeout = connectTimeout;
    return options;
  }

  BaseOptions _getDioBaseOptions(
      {Duration connectTimeout = const Duration(seconds: 60)}) {
    var options = _dioBaseOptions;
    options.connectTimeout = connectTimeout;
    options.receiveTimeout = connectTimeout;
    return options;
  }
}
