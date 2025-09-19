import 'package:employee_portal_mobile_app/feature/vacation/domain/use_case/approve_cancel_request_use_case.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/approve_cancel_request/approve_cancel_request_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/get_employee_vacations/get_employee_vacations_cubit.dart';
import '../../../feature/administrative_request/presentation/control/get_employee_administrative_request/get_employee_administrative_request_cubit.dart';
import '../../../feature/financial_request/presentation/control/get_employee_financial_request/get_employee_financial_request_cubit.dart';
import '../../../feature/mission_request/presentation/control/get_mission_request/get_mission_request_cubit.dart';
import '../../../feature/request/presentation/control/all_request/all_request_cubit.dart';
import '../../../feature/vacation/domain/use_case/get_employee_vacations_use_case.dart';
import '../../../feature/vacation/domain/use_case/get_vacation_requests_use_case.dart';
import '../../../feature/vacation/presentation/control/get_vacation_requests/get_vacation_requests_cubit.dart';
import 'depend_inject.dart';
import 'export_file/package_export.dart';
import 'init_cubit/init_administrative_cubit.dart';
import 'init_cubit/init_financial_cubit.dart';
import 'init_cubit/init_loan_cubit.dart';
import 'init_cubit/init_mission_cubit.dart';
import 'init_cubit/init_over_time_cubit.dart';
import 'init_cubit/init_permission_cubit.dart';

void initCubits() {
  sl.registerFactory(() => FilePickerCubit());
  sl.registerFactory(() => VacationTypeCubit(sl(), sl()));
  sl.registerFactory(() => DefaultReviewerCubit(sl()));
  sl.registerFactory(() => PostVacationCubit(sl()));
  sl.registerFactory(() => CalculateVacationDurationCubit(sl()));
  sl.registerFactory(() => DateCubit());
  sl.registerFactory(() => ValidateVacationCubit(sl()));
  sl.registerFactory(() => CheckHandledAlertsCubit(sl()));
  sl.registerFactory(() => VacationCubit());
  sl.registerFactory(() => VacationBalanceCubit(sl()));
  sl.registerFactory(
    () => SubmitVacationRequestCubit(
      calculateVacationDurationCubit: sl(),
      validateCubit: sl(),
      alertsCubit: sl(),
      postVacationCubit: sl(),
    ),
  );
  sl.registerFactory(() => ConnectInternetCubit());
  sl.registerFactory(
    () => GetEmployeeVacationsCubit(
      getEmployeeVacationsUseCase: sl<GetEmployeeVacationsUseCase>(),
    ),
  );
  sl.registerFactory(
    () => GetVacationRequestsCubit(
      getVacationRequestsUseCase: sl<GetVacationRequestsUseCase>(),
    ),
  );
  sl.registerFactory(
    () => ApproveCancelRequestCubit(
      approveCancelRequestUseCase: sl<ApproveCancelRequestUseCase>(),
    ),
  );

  // Financial
  initFinancialCubit();
  //Administrative
  initAdministrativeCubit();
  //mission
  initMissionCubit();
  //permission
  initPermissionCubit();
  //over time
  initOverTimeCubit();
  //loan
  initLoanCubit();
// All Request
  sl.registerFactory(
        () => AllRequestCubit(
      adminCubit: sl<GetEmployeeAdministrativeRequestCubit>(),
      financialCubit: sl<GetEmployeeFinancialRequestCubit>(),
      missionCubit: sl<GetMissionRequestCubit>(),
    ),
  );
}