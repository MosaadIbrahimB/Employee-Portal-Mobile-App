import 'package:employee_portal_mobile_app/core/service/api_service/api_service.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/use_case/check_handled_alerts_use_case.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/use_case/validate_vacation.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/check_handled_alerts/check_handled_alerts_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/date_cubit/date_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/file_picker/file_picker_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/validate_vacation/validate_vacation_cubit.dart';
import '../../../feature/vacation/domain/use_case/calculate_vacation_duration_use_case.dart';
import '../../../feature/vacation/presentation/control/calculate_vacation_duration/calculate_vacation_duration_cubit.dart';
import 'package_export.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Dio + UserId
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<String>(
    () => "b64f7a02-b625-46b7-8126-d3a20defdff8",
  );

  // 1. ApiService
  sl.registerLazySingleton<ApiService>(
    () => ApiService(dio: sl<Dio>(), userId: sl<String>()),
  );

  // 2. Remote Data Source
  sl.registerLazySingleton<VacationRemoteDataSource>(
    () => VacationRemoteImplDio(apiService: sl<ApiService>()),
  );

  // 3. Repository
  sl.registerLazySingleton<VacationRepository>(
    () => VacationRepositoryImpl(
      vacationRemoteDataSource: sl<VacationRemoteDataSource>(),
    ),
  );

  // 4. Use Cases
  sl.registerLazySingleton<GetVacationTypeUseCase>(
    () => GetVacationTypeUseCase(sl<VacationRepository>()),
  );
  sl.registerLazySingleton(
    () => GetDefaultReviewerUseCase(sl<VacationRepository>()),
  );
  sl.registerLazySingleton(() => PostVacationUseCase(sl<VacationRepository>()));
  sl.registerLazySingleton(
    () => CalculateVacationDurationUseCase(sl<VacationRepository>()),
  );
  sl.registerLazySingleton(
    () => ValidateVacationUseCase(sl<VacationRepository>()),
  );

  sl.registerLazySingleton<CheckHandledAlertsUseCase>(
        () => CheckHandledAlertsUseCase(sl<VacationRepository>()),
  );


  // 5. Cubits
  sl.registerFactory(() => FilePickerCubit());
  sl.registerFactory(
    () =>
        VacationTypeCubit(sl<GetVacationTypeUseCase>(), sl<FilePickerCubit>()),
  );
  sl.registerFactory(
    () => DefaultReviewerCubit(sl<GetDefaultReviewerUseCase>()),
  );
  sl.registerFactory(() => PostVacationCubit(sl<PostVacationUseCase>()));
  sl.registerFactory(
    () =>
        CalculateVacationDurationCubit(sl<CalculateVacationDurationUseCase>()),
  );
  sl.registerFactory(() => DateCubit());
  sl.registerFactory(
    () => ValidateVacationCubit(sl<ValidateVacationUseCase>()),
  );

  sl.registerFactory(() => CheckHandledAlertsCubit(sl<CheckHandledAlertsUseCase>()));

  // 6. Connectivity
  sl.registerLazySingleton(() => ConnectInternetCubit()..checkConnection());
}
