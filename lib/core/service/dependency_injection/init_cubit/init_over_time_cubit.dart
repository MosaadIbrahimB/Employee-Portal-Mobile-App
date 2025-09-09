import '../../../../feature/over_time/domin/use_case/get_alert_over_time_use_case.dart';
import '../../../../feature/over_time/domin/use_case/get_alerts_over_time_use_case.dart';
import '../../../../feature/over_time/domin/use_case/get_employee_over_time_use_case.dart';
import '../../../../feature/over_time/domin/use_case/get_reviewer_over_time_use_case.dart';
import '../../../../feature/over_time/domin/use_case/get_type_over_time_use_case.dart';
import '../../../../feature/over_time/domin/use_case/post_over_time_use_case.dart';
import '../../../../feature/over_time/presentation/control/get_alert_over_time/get_alert_over_time_cubit.dart';
import '../../../../feature/over_time/presentation/control/get_alerts_over_time/get_alerts_over_time_cubit.dart';
import '../../../../feature/over_time/presentation/control/get_employee_over_time/get_employee_over_time_cubit.dart';
import '../../../../feature/over_time/presentation/control/get_reviewer_over_time/get_reviewer_over_time_cubit.dart';
import '../../../../feature/over_time/presentation/control/get_type_over_time/get_type_over_time_cubit.dart';
import '../../../../feature/over_time/presentation/control/post_over_time/post_over_time_request_cubit.dart';
import '../depend_inject.dart';

void initOverTimeCubit() {

  sl.registerFactory(
        () => GetTypeOverTimeCubit(getTypeOverTimeUseCase: sl<GetTypeOverTimeUseCase>()),
  );


  sl.registerFactory(
        () => GetAlertOverTimeCubit(getAlertOverTimeUseCase: sl<GetAlertOverTimeUseCase>()),
  );
  sl.registerFactory(
        () => GetAlertsOverTimeCubit(getAlertsOverTimeUseCase: sl<GetAlertsOverTimeUseCase>()),
  );

  sl.registerFactory(
        () => GetEmployeeOverTimeCubit(getEmployeeOverTimeUseCase: sl<GetEmployeeOverTimeUseCase>()),
  );

  sl.registerFactory(
        () => GetReviewerOverTimeCubit(getReviewerOverTimeUseCase: sl<GetReviewerOverTimeUseCase>()),
  );

  sl.registerFactory(
        () => PostOverTimeRequestCubit( sl<PostOverTimeUseCase>()),
  );
}
