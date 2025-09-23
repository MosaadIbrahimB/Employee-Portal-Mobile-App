import 'package:employee_portal_mobile_app/feature/administrative_request/data/data_source/remote/administrative_request_remote_data_source.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/data_source/remote/financial_request_remote_data_source.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/data_source/remote/financial_request_remote_data_source_impl.dart';

import '../../../feature/administrative_request/data/data_source/remote/administrative_request_remote_data_source_impl.dart';
import '../../../feature/loan/data/data_source/loan_remote_data_source.dart';
import '../../../feature/loan/data/data_source/remote/loan_remote_data_source_imp.dart';
import '../../../feature/mission_request/data/data_source/remote/mission_request_remote_data_source.dart';
import '../../../feature/mission_request/data/data_source/remote/mission_request_remote_data_source_impl.dart';
import '../../../feature/over_time/data/data_source/remote/over_time__remote_data_source_impl.dart';
import '../../../feature/over_time/data/data_source/remote/over_time_remote_data_source.dart';
import '../../../feature/permission_request/data/data_source/remote/permission_request_remote_data_source.dart';
import '../../../feature/permission_request/data/data_source/remote/permission_request_remote_data_source_impl.dart';
import 'export_file/package_export.dart';
import 'depend_inject.dart';


void initDataSources() {
  sl.registerLazySingleton<VacationRemoteDataSource>(
        () => VacationRemoteImplDio(apiService: sl<DioConsumer>(instanceName: "main")),
  );


  // sl.registerLazySingleton<RequestRemoteDataSource>(
  //       () => RequestRemoteImplDio(apiService: sl<ApiService>(instanceName: "mohr")),
  // );


  sl.registerLazySingleton<FinancialRequestRemoteDataSource>(
        () => FinancialRequestRemoteDataSourceImpl(apiService: sl<DioConsumer>(instanceName: "mohr")),
  );

  sl.registerLazySingleton<AdministrativeRequestRemoteDataSource>(
        () => AdministrativeRequestRemoteDataSourceImpl(apiService: sl<DioConsumer>(instanceName: "mohr")),
  );

  sl.registerLazySingleton<MissionRequestRemoteDataSource>(
        () => MissionRequestRemoteDataSourceImpl(apiService: sl<DioConsumer>(instanceName: "mohr")),
  );

  sl.registerLazySingleton<PermissionRequestRemoteDataSource>(
        () => PermissionRequestRemoteDataSourceImpl(apiService: sl<DioConsumer>(instanceName: "mohr")),
  );

  sl.registerLazySingleton<OverTimeRequestRemoteDataSource>(
        () => OverTimeRequestRemoteDataSourceImpl(apiService: sl<DioConsumer>(instanceName: "mohr")),
  );

  sl.registerLazySingleton<LoanRemoteDataSource>(
        () => LoanRemoteDataSourceImp(apiService: sl<DioConsumer>(instanceName: "main")),
  );

}
