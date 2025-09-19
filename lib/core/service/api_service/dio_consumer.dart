import 'package:dio/dio.dart';
import 'package:employee_portal_mobile_app/core/error/handle_dio_exception.dart';
import 'package:employee_portal_mobile_app/core/service/api_service/dio_helper.dart';
import 'api_consumer.dart';
class DioConsumer extends ApiConsumer {
  final DioHelper dioHelper;

  DioConsumer({required this.dioHelper});

  @override
  Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? queryParams,
  })
  async {
    try {
      final uri = Uri.parse(endPoint).replace(queryParameters: queryParams);
      final response = await dioHelper.dio.get(uri.toString());
      return response;
    } on DioException catch (e) {
      throw handleDioException(e);
    }
  }

  @override
  Future<Response> post({required String endPoint, dynamic data})
  async {
    try {
      final response = await dioHelper.dio.post(endPoint, data: data);
      return response;
    } on DioException catch (e) {
      throw handleDioException(e);
    }
  }

  @override
  Future<Response> put({required String endPoint, dynamic data})
  async {
    try {
      final response = await dioHelper.dio.put(endPoint, data: data);
      return response;
    } on DioException catch (e) {
      throw handleDioException(e);
    }
  }

  @override
  Future<Response> delete({
    required String endPoint,
    dynamic data,
  })
  async {
    try {
      final response = await dioHelper.dio.delete(endPoint, data: data);
      return response;
    } on DioException catch (e) {
      throw handleDioException(e);
    }
  }
}

