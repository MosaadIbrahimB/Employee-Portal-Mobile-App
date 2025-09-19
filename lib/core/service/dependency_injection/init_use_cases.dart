import 'package:employee_portal_mobile_app/core/service/dependency_injection/init_use_case/init_over_time_use_case.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/use_case/approve_cancel_request_use_case.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/use_case/get_employee_vacations_use_case.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/use_case/get_vacation_requests_use_case.dart';
import 'depend_inject.dart';
import 'export_file/package_export.dart';
import 'init_use_case/init_admin_use_case.dart';
import 'init_use_case/init_financial_use_case.dart';
import 'init_use_case/init_loan_use_case.dart';
import 'init_use_case/init_mission_use_case.dart';
import 'init_use_case/init_permission_use_case.dart';

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
  initFinancialUseCase();
  //Administrative
  initAdminUseCase();
  //mission
  initMissionUseCase();
  //permission
  initPermissionUseCase();
  //overtime
  initOverTimeUseCase();
//Loan
  initLoanUseCase();

}
