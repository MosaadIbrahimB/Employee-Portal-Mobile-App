import 'package:employee_portal_mobile_app/feature/request/domain/use_case/get_reviewer_financial_request_use_case.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/use_case/approve_cancel_request_use_case.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/use_case/get_employee_vacations_use_case.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/use_case/get_vacation_requests_use_case.dart';

import '../../../feature/request/domain/repository/request_repository.dart';
import '../../../feature/request/domain/use_case/get_admin_request_type_use_case.dart';
import '../../../feature/request/domain/use_case/get_employee_administrative_request_use_case.dart';
import '../../../feature/request/domain/use_case/get_employee_financial_use_case.dart';
import '../../../feature/request/domain/use_case/get_financial_request_type_use_case.dart';
import '../../../feature/request/domain/use_case/get_reviewer_administrative_request.dart';
import '../../../feature/request/domain/use_case/post_administrative_request_use_case.dart';
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
  // Registering the GetFinancialRequestUseCase
  sl.registerLazySingleton(() => GetAdminRequestTypeUseCase(requestRepository: sl<RequestRepository>()));
  sl.registerLazySingleton(() => GetFinancialRequestTypeUseCase(requestRepository: sl<RequestRepository>()));

  sl.registerLazySingleton(() => GetEmployeeAdministrativeRequestUseCase(requestRepository: sl<RequestRepository>()));
  sl.registerLazySingleton(() => GetReviewerAdministrativeRequestUseCase(requestRepository: sl<RequestRepository>()));
  sl.registerLazySingleton(() => PostAdministrativeFinancialRequestUseCase(requestRepository: sl<RequestRepository>()));

  sl.registerLazySingleton(() => GetEmployeeFinancialUseCase(requestRepository: sl<RequestRepository>()));
  sl.registerLazySingleton(() => GetReviewerFinancialRequestUseCase(requestRepository: sl<RequestRepository>()));


}
