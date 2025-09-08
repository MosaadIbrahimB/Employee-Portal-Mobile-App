import '../../../../feature/mission_request/domain/use_case/get_employee_mission_request_use_case.dart';
import '../../../../feature/mission_request/domain/use_case/get_mission_use_case.dart';
import '../../../../feature/mission_request/domain/use_case/get_reviewer_mission_request_use_case.dart';
import '../../../../feature/mission_request/domain/use_case/post_mission_requests.dart';
import '../../../../feature/mission_request/presentation/control/get_employee_mission/get_employee_mission_cubit.dart';
import '../../../../feature/mission_request/presentation/control/get_mission_request/get_mission_request_cubit.dart';
import '../../../../feature/mission_request/presentation/control/get_reviewer_mission_request/get_reviewer_mission_request_cubit.dart';
import '../../../../feature/mission_request/presentation/control/post_mission_request/post_mission_request_cubit.dart';
import '../depend_inject.dart';

void initMissionCubit() {
  sl.registerFactory(
        () => GetMissionRequestCubit(getMissionUseCase: sl<GetMissionUseCase>()),
  );
  sl.registerFactory(
        () => GetEmployeeMissionCubit(getEmployeeMissionUseCase: sl<GetEmployeeMissionUseCase>()),
  );
  sl.registerFactory(
        () => GetReviewerMissionRequestCubit(getReviewerMissionUseCase: sl<GetReviewerMissionUseCase>()),
  );
  sl.registerFactory(
        () => PostMissionRequestCubit(sl<PostMissionUseCase>()),
  );

}
