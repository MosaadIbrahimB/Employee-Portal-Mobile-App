import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/submit_vacation_request/submit_vacation_request_cubit.dart';

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


  sl.registerFactory(
    () => SubmitVacationRequestCubit(
      calculateVacationDurationCubit: sl<CalculateVacationDurationCubit>(),
      validateCubit: sl<ValidateVacationCubit>(),
      alertsCubit: sl<CheckHandledAlertsCubit>(),postVacationCubit: sl<PostVacationCubit>()
    ),
  );

  // 6. Connectivity
  sl.registerLazySingleton(() => ConnectInternetCubit()..checkConnection());
}
