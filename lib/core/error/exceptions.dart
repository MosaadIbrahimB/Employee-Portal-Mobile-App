import 'package:employee_portal_mobile_app/core/error/error_model.dart';

class ServerException implements Exception {
final ErrorModel errorModel;

  ServerException({required this.errorModel});

  @override
  String toString() => 'ServerException: ${errorModel.message}\nstatus code: ${errorModel.statusCode}';


}
class NetworkException implements Exception {
  final String message;

  NetworkException([this.message = 'فشل في الاتصال بالإنترنت']);

  @override
  String toString() => 'NetworkException: $message';
}
class CacheException implements Exception {
  final String message;

  CacheException([this.message = 'فشل في التعامل مع الكاش']);

  @override
  String toString() => 'CacheException: $message';
}
class NotFoundException implements Exception {
  final String message;

  NotFoundException([this.message = 'العنصر غير موجود']);

  @override
  String toString() => 'NotFoundException: $message';
}
class InvalidDataException implements Exception {
  final String message;

  InvalidDataException([this.message = 'البيانات غير صالحة']);

  @override
  String toString() => 'InvalidDataException: $message';
}
class UnknownException implements Exception {
  final String message;

  UnknownException([this.message = 'حدث خطأ غير معروف']);

  @override
  String toString() => 'UnknownException: $message';
}
