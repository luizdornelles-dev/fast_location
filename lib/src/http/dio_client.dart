import 'package:dio/dio.dart';

class DioClient {
  late Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        
        baseUrl: 'https://viacep.com.br/ws',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        responseType: ResponseType.json,
      ),
    );
  }

  
  Dio get dio => _dio;
}
