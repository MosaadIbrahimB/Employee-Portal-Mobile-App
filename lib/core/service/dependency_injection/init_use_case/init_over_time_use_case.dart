import '../../../../feature/over_time/domin/repository/over_time_repository.dart';
import '../../../../feature/over_time/domin/use_case/get_alert_over_time_use_case.dart';
import '../../../../feature/over_time/domin/use_case/get_alerts_over_time_use_case.dart';
import '../../../../feature/over_time/domin/use_case/get_employee_over_time_use_case.dart';
import '../../../../feature/over_time/domin/use_case/get_reviewer_over_time_use_case.dart';
import '../../../../feature/over_time/domin/use_case/get_type_over_time_use_case.dart';
import '../../../../feature/over_time/domin/use_case/post_over_time_use_case.dart';
import '../depend_inject.dart';

initOverTimeUseCase(){
  sl.registerLazySingleton(
        () => GetTypeOverTimeUseCase(repository: sl<OverTimeRepository>()),
  );
  sl.registerLazySingleton(
        () => GetAlertOverTimeUseCase(repository: sl<OverTimeRepository>()),
  );
  sl.registerLazySingleton(
        () => GetAlertsOverTimeUseCase(repository: sl<OverTimeRepository>()),
  );
  sl.registerLazySingleton(
        () => GetEmployeeOverTimeUseCase(repository: sl<OverTimeRepository>()),
  );
  sl.registerLazySingleton(
        () => GetReviewerOverTimeUseCase(repository: sl<OverTimeRepository>()),
  );
  sl.registerLazySingleton(
        () => PostOverTimeUseCase(repository: sl<OverTimeRepository>()),
  );
}