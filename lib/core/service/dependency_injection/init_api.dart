import 'export_file/package_export.dart';
import 'depend_inject.dart';


void initApi() {
  sl.registerLazySingleton<ApiService>(
        () => ApiService(dio: sl<Dio>(), userId: sl<String>()),
  );
}
