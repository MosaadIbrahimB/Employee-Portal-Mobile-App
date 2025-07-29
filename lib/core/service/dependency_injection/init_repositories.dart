import 'package:employee_portal_mobile_app/feature/request/data/repository/request_repository_impl.dart';

import '../../../feature/request/domain/repository/request_repository.dart';
import 'export_file/package_export.dart';
import 'depend_inject.dart';

void initRepositories() {
  sl.registerLazySingleton<VacationRepository>(() => VacationRepositoryImpl(vacationRemoteDataSource: sl(),));

  sl.registerLazySingleton<RequestRepository>(() => RequestRepositoryImpl(requestRemoteDataSource: sl()));
}
