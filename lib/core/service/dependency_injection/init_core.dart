import 'package:dio/dio.dart';
import 'package:employee_portal_mobile_app/core/service/api_service/dio_helper.dart';
import 'package:employee_portal_mobile_app/core/utils/end_point.dart';
import 'depend_inject.dart';
void initCore() {
  // Dio الأساسي
  sl.registerLazySingleton<Dio>(() => Dio(), instanceName: "main");
  sl.registerLazySingleton<Dio>(() => Dio(), instanceName: "mohr");

  // UserId مشترك
  // sl.registerLazySingleton<String>(() => "8a92700c-22d7-4233-9b97-60dbb0a53814");
  // sl.registerLazySingleton<String>(() => "b64f7a02-b625-46b7-8126-d3a20defdff8");
  sl.registerLazySingleton<String>(() => "f3176e6f-bd11-4a6b-a859-fa9c39f6213c");
  // sl.registerLazySingleton<String>(() => "7ef59402-fd25-4925-a8e7-a3faee95d2a3");
  //
  // DioHelper الأساسي (baseUrl)
  sl.registerLazySingleton<DioHelper>(
        () => DioHelper(
      userId: sl<String>(),
      dio: sl<Dio>(instanceName: "main"),
      customBaseUrl: EndPoint.baseUrl,
    ),
    instanceName: "main",
  );

  // DioHelper الثاني (baseUrlMohr)
  sl.registerLazySingleton<DioHelper>(
        () => DioHelper(
      userId: sl<String>(),
      dio: sl<Dio>(instanceName: "mohr"),
      customBaseUrl: EndPoint.baseUrlMohr,
    ),
    instanceName: "mohr",
  );
}

// void initCore() {
//   sl.registerLazySingleton(() => Dio());
//   // sl.registerLazySingleton<String>(() => "b64f7a02-b625-46b7-8126-d3a20defdff8");
//   // sl.registerLazySingleton<String>(() => "cf92e40e-1bff-4b40-886e-badb7bebe638");
//   sl.registerLazySingleton<String>(() => "8a92700c-22d7-4233-9b97-60dbb0a53814");
//
//
//
//   sl.registerLazySingleton<DioHelper>(
//         () => DioHelper(userId: sl<String>(), dio: sl<Dio>()),
//   );
//
//
//
// }
