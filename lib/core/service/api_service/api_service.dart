import 'package:dio/dio.dart';
import 'package:employee_portal_mobile_app/core/error/exception.dart';

class ApiService {
  final Dio dio;
  final String userId;

  ApiService({required this.dio, required this.userId});

  Options get _headers => Options(
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "userId": userId,
    },
  );

  Future<Response> getRequest(String url, {Map<String, dynamic>? queryParams}) async {
    final uri = Uri.parse(url).replace(queryParameters: queryParams);
    final response = await dio.get(uri.toString(), options: _headers);

    if (response.statusCode == 200) return response;
    throw ServerException();
  }

  Future<Response> postRequest(String url, dynamic data) async {
    final response = await dio.post(url, data: data, options: _headers);

    if (response.statusCode == 200 || response.statusCode == 201) return response;
    throw ServerException();
  }
}
