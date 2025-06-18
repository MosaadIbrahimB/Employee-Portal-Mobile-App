import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/get_employee_vacations/get_employee_vacations_cubit.dart';
import '../../../feature/vacation/domain/use_case/get_employee_vacations_use_case.dart';
import '../../../feature/vacation/domain/use_case/get_vacation_requests_use_case.dart';
import '../../../feature/vacation/presentation/control/get_vacation_requests/get_vacation_requests_cubit.dart';
import 'export_file/package_export.dart';
import 'depend_inject.dart';

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
  sl.registerFactory(() => SubmitVacationRequestCubit(
    calculateVacationDurationCubit: sl(),
    validateCubit: sl(),
    alertsCubit: sl(),
    postVacationCubit: sl(),
  ));
  sl.registerFactory(() => ConnectInternetCubit());
  sl.registerFactory(() => GetEmployeeVacationsCubit(getEmployeeVacationsUseCase: sl<GetEmployeeVacationsUseCase>()));
  sl.registerFactory(() => GetVacationRequestsCubit(getVacationRequestsUseCase: sl<GetVacationRequestsUseCase>()));
}
