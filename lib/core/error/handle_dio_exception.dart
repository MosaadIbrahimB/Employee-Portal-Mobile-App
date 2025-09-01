// import 'package:dio/dio.dart';
// import 'exceptions.dart';
// Exception handleDioException(DioException dioError) {
//   switch (dioError.type) {
//     case DioExceptionType.connectionTimeout:
//     case DioExceptionType.sendTimeout:
//     case DioExceptionType.receiveTimeout:
//       return NetworkException('انتهت مهلة الاتصال بالخادم');
//
//     case DioExceptionType.badCertificate:
//       return NetworkException('شهادة SSL غير صالحة');
//
//     case DioExceptionType.badResponse:
//       final statusCode = dioError.response?.statusCode;
//       final message = dioError.response?.statusMessage ?? 'استجابة غير صحيحة من السيرفر';
//
//       switch (statusCode) {
//         case 400:
//         case 422:
//           return InvalidDataException('البيانات المُرسلة غير صحيحة');
//         case 404:
//           return NotFoundException('العنصر غير موجود');
//         case 500:
//           return ServerException(message: 'خطأ داخلي في السيرفر', statusCode: 500);
//         default:
//           return ServerException(message: message, statusCode: statusCode);
//       }
//
//     case DioExceptionType.cancel:
//       return UnknownException('تم إلغاء الطلب');
//
//     case DioExceptionType.connectionError:
//       return NetworkException('تعذر الاتصال بالخادم');
//
//     case DioExceptionType.unknown:
//       return UnknownException('حدث خطأ غير متوقع');
//
//   }
// }
