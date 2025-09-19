import 'package:employee_portal_mobile_app/core/service/api_service/dio_helper.dart';
import 'export_file/package_export.dart';
import 'depend_inject.dart';

void initApi() {
  sl.registerLazySingleton<DioConsumer>(
        () => DioConsumer(dioHelper: sl<DioHelper>(instanceName: "main")),
    instanceName: "main",
  );

  sl.registerLazySingleton<DioConsumer>(
        () => DioConsumer(dioHelper: sl<DioHelper>(instanceName: "mohr")),
    instanceName: "mohr",
  );
}

