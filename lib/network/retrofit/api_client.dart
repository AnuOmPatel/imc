import 'package:dio/dio.dart';
import 'api_service.dart';


class ApiClient {
  static final Dio dio = Dio(); // You can add interceptors here
  static final ApiService apiService = ApiService(dio);
}
