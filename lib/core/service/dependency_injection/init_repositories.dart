import 'package:employee_portal_mobile_app/feature/administrative_request/domain/repository/administrative_repository.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/repository_impl/financial_repository_impl.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/domain/repository/financial_repository.dart';

import '../../../feature/administrative_request/data/data_source/remote/administrative_request_remote_data_source.dart';
import '../../../feature/administrative_request/data/repository_impl/administrative_repository_impl.dart';
import '../../../feature/financial_request/data/data_source/remote/financial_request_remote_data_source.dart';
import '../../../feature/mission_request/data/data_source/remote/mission_request_remote_data_source.dart';
import '../../../feature/mission_request/data/repository_impl/mission_repository_impl.dart';
import '../../../feature/mission_request/domain/repository/mission_repository.dart';
import 'export_file/package_export.dart';
import 'depend_inject.dart';

void initRepositories() {
  sl.registerLazySingleton<VacationRepository>(() => VacationRepositoryImpl(vacationRemoteDataSource: sl(),));

  // sl.registerLazySingleton<RequestRepository>(() => RequestRepositoryImpl(requestRemoteDataSource: sl()));

  sl.registerLazySingleton<FinancialRequestRepository>(() => FinancialRequestRepositoryImpl(financialRequestRemoteDataSource: sl<FinancialRequestRemoteDataSource>()));
  sl.registerLazySingleton<AdministrativeRequestRepository>(() => AdministrativeRequestRepositoryImpl(administrativeRequestRemoteDataSource: sl<AdministrativeRequestRemoteDataSource>()));
  sl.registerLazySingleton<MissionRequestRepository>(() => MissionRepositoryImpl(missionRequestRemoteDataSource: sl<MissionRequestRemoteDataSource>()));
}
