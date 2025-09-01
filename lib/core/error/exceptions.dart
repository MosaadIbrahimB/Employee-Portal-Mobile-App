import 'package:dio/dio.dart';

class ServerException implements Exception {
  final String? message;
  final int? statusCode;


  ServerException({this.message = 'حدث خطأ في الخادم', this.statusCode });

  @override
  String toString() => 'ServerException: $message (status code: $statusCode)';
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
Exception handleDioException(DioException dioError) {
  switch (dioError.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return NetworkException('انتهت مهلة الاتصال بالخادم');

    case DioExceptionType.badCertificate:
      return NetworkException('شهادة SSL غير صالحة');

    case DioExceptionType.badResponse:
      final statusCode = dioError.response?.statusCode;
      final message = dioError.response?.statusMessage ?? 'استجابة غير صحيحة من السيرفر';

      switch (statusCode) {
        case 400:
        case 422:
          return InvalidDataException('البيانات المُرسلة غير صحيحة');
        case 404:
          return NotFoundException('العنصر غير موجود');
        case 500:
          return ServerException(message: 'خطأ داخلي في السيرفر', statusCode: 500);
        default:
          return ServerException(message: message, statusCode: statusCode);
      }

    case DioExceptionType.cancel:
      return UnknownException('تم إلغاء الطلب');

    case DioExceptionType.connectionError:
      return NetworkException('تعذر الاتصال بالخادم');

    case DioExceptionType.unknown:
    return UnknownException('حدث خطأ غير متوقع');

    }
}
