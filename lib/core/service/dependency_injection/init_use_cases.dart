import 'package:employee_portal_mobile_app/feature/vacation/domain/use_case/approve_cancel_request_use_case.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/use_case/get_employee_vacations_use_case.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/use_case/get_vacation_requests_use_case.dart';

import 'package:employee_portal_mobile_app/feature/financial_request/domain/repository/financial_repository.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/domain/use_case/get_reviewer_financial_request_use_case.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/domain/use_case/post_financial_request_use_case.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/domain/use_case/get_employee_financial_use_case.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/domain/use_case/get_financial_request_type_use_case.dart';

import '../../../feature/administrative_request/domain/repository/administrative_repository.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/domain/use_case/post_administrative_request_use_case.dart';
import '../../../feature/administrative_request/domain/use_case/get_administrative_request_type_use_case.dart';
import '../../../feature/administrative_request/domain/use_case/get_employee_administrative_use_case.dart';
import '../../../feature/administrative_request/domain/use_case/get_reviewer_administrative_request_use_case.dart';
import '../../../feature/mission_request/domain/repository/mission_repository.dart';
import '../../../feature/mission_request/domain/use_case/get_employee_mission_request_use_case.dart';
import '../../../feature/mission_request/domain/use_case/get_mission_use_case.dart';
import '../../../feature/mission_request/domain/use_case/get_reviewer_mission_request_use_case.dart';
import '../../../feature/mission_request/domain/use_case/post_mission_requests.dart';
import 'export_file/package_export.dart';
import 'depend_inject.dart';


void initUseCases() {
  sl.registerLazySingleton(() => GetVacationTypeUseCase(sl()));
  sl.registerLazySingleton(() => GetDefaultReviewerUseCase(sl()));
  sl.registerLazySingleton(() => PostVacationUseCase(sl()));
  sl.registerLazySingleton(() => CalculateVacationDurationUseCase(sl()));
  sl.registerLazySingleton(() => ValidateVacationUseCase(sl()));
  sl.registerLazySingleton(() => CheckHandledAlertsUseCase(sl()));
  sl.registerLazySingleton(() => GetVacationBalanceUseCase(sl()));
  sl.registerLazySingleton(() => GetEmployeeVacationsUseCase(sl()));
  sl.registerLazySingleton(() => GetVacationRequestsUseCase(sl()));
  sl.registerLazySingleton(() => ApproveCancelRequestUseCase(sl()));
  // Financial
  sl.registerLazySingleton(() => GetEmployeeFinancialUseCase(repository: sl<FinancialRequestRepository>()));
  sl.registerLazySingleton(() => GetFinancialRequestTypeUseCase(repository: sl<FinancialRequestRepository>()));
  sl.registerLazySingleton(() => GetReviewerFinancialRequestUseCase(repository: sl<FinancialRequestRepository>()));
  sl.registerLazySingleton(() => PostFinancialRequestUseCase(repository: sl<FinancialRequestRepository>()));
//Administrative
  sl.registerLazySingleton(() => GetAdministrativeRequestTypeUseCase(repository: sl<AdministrativeRequestRepository>()));
  sl.registerLazySingleton(() => GetEmployeeAdministrativeUseCase(repository: sl<AdministrativeRequestRepository>()));
  sl.registerLazySingleton(() => GetReviewerAdministrativeRequestUseCase(repository: sl<AdministrativeRequestRepository>()));
  sl.registerLazySingleton(() => PostAdministrativeRequestUseCase(repository: sl<AdministrativeRequestRepository>()));
//mission
  sl.registerLazySingleton(() => GetMissionUseCase(repository: sl<MissionRequestRepository>()));
  sl.registerLazySingleton(() => GetEmployeeMissionUseCase(repository: sl<MissionRequestRepository>()));
  sl.registerLazySingleton(() => GetReviewerMissionUseCase(repository: sl<MissionRequestRepository>()));
  sl.registerLazySingleton(() => PostMissionUseCase(repository: sl<MissionRequestRepository>()));



}
