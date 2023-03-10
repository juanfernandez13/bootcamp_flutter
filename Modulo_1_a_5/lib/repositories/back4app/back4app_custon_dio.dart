import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:trilhaapp/repositories/back4app/back4app_dio_interceptor.dart';

class Back4AppCustonDio {
  final _dio = Dio();
  Dio get dio => _dio;

  Back4AppCustonDio() {
    _dio.options.headers["Content-Type"] = dotenv.get("CONTENTTYPE");
    _dio.options.baseUrl = dotenv.get("BASEURLBACK4APP");
    _dio.interceptors.add(Back4AppDioInterceptor());
  }
}
