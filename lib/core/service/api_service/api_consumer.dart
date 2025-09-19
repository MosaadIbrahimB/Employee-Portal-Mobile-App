import 'package:dio/dio.dart';
abstract class ApiConsumer  {
  Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? queryParams,
  });
  Future<Response> post({required String endPoint, dynamic data});
  Future<Response> put({required String endPoint, dynamic data});
  Future<Response> delete({
    required String endPoint,
    dynamic data,
  });
}
