import '../../../../feature/vacation/domain/use_case/get_employee_vacations_use_case.dart';
import '../../../../feature/vacation/domain/use_case/get_vacation_requests_use_case.dart';
import '../../../../feature/vacation/presentation/control/calculate_vacation_duration/calculate_vacation_duration_cubit.dart';
import '../../../../feature/vacation/presentation/control/get_employee_vacations/get_employee_vacations_cubit.dart';
import '../../../../feature/vacation/presentation/control/get_vacation_requests/get_vacation_requests_cubit.dart';
import '../../../../feature/vacation/presentation/control/post_vacation/post_vacation_cubit.dart';
import '../../../../feature/vacation/presentation/control/submit_vacation_request/submit_vacation_request_cubit.dart';
import '../../../../feature/vacation/presentation/control/vacation_balance/vacation_balance_cubit.dart';
import '../../../../feature/vacation/presentation/control/vacation_cubit/vacation_cubit.dart';
import '../../../../feature/vacation/presentation/control/vacation_type/vacation_type_cubit.dart';
import '../../../../feature/vacation/presentation/control/validate_vacation/validate_vacation_cubit.dart';
import '../depend_inject.dart';

void initVacationCubit(){
  sl.registerFactory(() => VacationTypeCubit(sl(), sl()));

  sl.registerFactory(() => PostVacationCubit(sl()));

  sl.registerFactory(() => CalculateVacationDurationCubit(sl()));

  sl.registerFactory(() => ValidateVacationCubit(sl()));

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

}