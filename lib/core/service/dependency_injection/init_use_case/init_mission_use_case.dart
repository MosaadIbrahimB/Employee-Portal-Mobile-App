 import '../../../../feature/mission_request/domain/repository/mission_repository.dart';
import '../../../../feature/mission_request/domain/use_case/get_employee_mission_request_use_case.dart';
import '../../../../feature/mission_request/domain/use_case/get_mission_use_case.dart';
import '../../../../feature/mission_request/domain/use_case/get_reviewer_mission_request_use_case.dart';
import '../../../../feature/mission_request/domain/use_case/post_mission_requests.dart';
import '../depend_inject.dart';

initMissionUseCase () {
  sl.registerLazySingleton(
        () => GetMissionUseCase(repository: sl<MissionRequestRepository>()),
  );
  sl.registerLazySingleton(
        () => GetEmployeeMissionUseCase(repository: sl<MissionRequestRepository>()),
  );
  sl.registerLazySingleton(
        () => GetReviewerMissionUseCase(repository: sl<MissionRequestRepository>()),
  );
  sl.registerLazySingleton(
        () => PostMissionUseCase(repository: sl<MissionRequestRepository>()),
  );
 }