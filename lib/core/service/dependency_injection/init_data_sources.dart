import '../../../feature/request/data/data_source/remote/request_remote_data_source.dart';
import '../../../feature/request/data/data_source/remote/request_remote_impl_dio.dart';
import 'export_file/package_export.dart';
import 'depend_inject.dart';


void initDataSources() {
  sl.registerLazySingleton<VacationRemoteDataSource>(
        () => VacationRemoteImplDio(apiService: sl<ApiService>(instanceName: "main")),
  );


  sl.registerLazySingleton<RequestRemoteDataSource>(
        () => RequestRemoteImplDio(apiService: sl<ApiService>(instanceName: "mohr")),
  );
}
