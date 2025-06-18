import 'package:dio/dio.dart';
import 'package:employee_portal_mobile_app/core/service/api_service/dio_helper.dart';
import 'depend_inject.dart';

void initCore() {
  sl.registerLazySingleton(() => Dio());
  // sl.registerLazySingleton<String>(() => "b64f7a02-b625-46b7-8126-d3a20defdff8");
  sl.registerLazySingleton<String>(() => "cf92e40e-1bff-4b40-886e-badb7bebe638");



  sl.registerLazySingleton<DioHelper>(
        () => DioHelper(userId: sl<String>(), dio: sl<Dio>()),
  );



}
