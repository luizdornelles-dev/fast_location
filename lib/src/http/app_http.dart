import 'package:dio/dio.dart';

class AppHttp {
  static const String _baseUrl = 'https://viacep.com.br/ws';

  static const int _connectTimeout = 5000;
  static const int _receiveTimeout = 3000;

  late Dio _dio;

  AppHttp() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: Duration(milliseconds: _connectTimeout),
        receiveTimeout: Duration(milliseconds: _receiveTimeout),
        responseType: ResponseType.json,
      ),
    );
  }

  Dio get instance => _dio;
}
