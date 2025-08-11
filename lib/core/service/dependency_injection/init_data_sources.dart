import 'package:employee_portal_mobile_app/feature/administrative_request/data/data_source/remote/administrative_request_remote_data_source.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/data_source/remote/financial_request_remote_data_source.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/data_source/remote/financial_request_remote_data_source_impl.dart';

import '../../../feature/administrative_request/data/data_source/remote/administrative_request_remote_data_source_impl.dart';
import '../../../feature/mission_request/data/data_source/remote/mission_request_remote_data_source.dart';
import '../../../feature/mission_request/data/data_source/remote/mission_request_remote_data_source_impl.dart';
import 'export_file/package_export.dart';
import 'depend_inject.dart';


void initDataSources() {
  sl.registerLazySingleton<VacationRemoteDataSource>(
        () => VacationRemoteImplDio(apiService: sl<ApiService>(instanceName: "main")),
  );


  // sl.registerLazySingleton<RequestRemoteDataSource>(
  //       () => RequestRemoteImplDio(apiService: sl<ApiService>(instanceName: "mohr")),
  // );


  sl.registerLazySingleton<FinancialRequestRemoteDataSource>(
        () => FinancialRequestRemoteDataSourceImpl(apiService: sl<ApiService>(instanceName: "mohr")),
  );

  sl.registerLazySingleton<AdministrativeRequestRemoteDataSource>(
        () => AdministrativeRequestRemoteDataSourceImpl(apiService: sl<ApiService>(instanceName: "mohr")),
  );

  sl.registerLazySingleton<MissionRequestRemoteDataSource>(
        () => MissionRequestRemoteDataSourceImpl(apiService: sl<ApiService>(instanceName: "mohr")),
  );

}
