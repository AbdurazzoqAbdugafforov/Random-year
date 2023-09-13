import 'package:dio/dio.dart';

class HttpService {
  Dio client() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'http://numbersapi.com',
        connectTimeout: const Duration(seconds: 60),
      ),
    );
    dio.interceptors.add(
      LogInterceptor(request: true, requestBody: true, responseBody: true),
    );
    return dio;
  }
}
