 import '../../../../feature/permission_request/domain/repository/permission_repository.dart';
import '../../../../feature/permission_request/domain/use_case/get_allowed_permission_use_case.dart';
import '../../../../feature/permission_request/domain/use_case/get_employee_permission_request_use_case.dart';
import '../../../../feature/permission_request/domain/use_case/get_permission_use_case.dart';
import '../../../../feature/permission_request/domain/use_case/get_reviewer_permission_use_case.dart';
import '../../../../feature/permission_request/domain/use_case/post_permission_use_case.dart';
import '../depend_inject.dart';

initPermissionUseCase () {
   sl.registerLazySingleton(
         () => GetPerMissionUseCase(repository: sl<PerMissionRequestRepository>()),
   );
   sl.registerLazySingleton(
         () => GetAllowedPermissionUseCase(
       repository: sl<PerMissionRequestRepository>(),
     ),
   );
   sl.registerLazySingleton(
         () => GetEmployeePermissionRequestUseCase(
       repository: sl<PerMissionRequestRepository>(),
     ),
   );
   sl.registerLazySingleton(
         () => GetReviewerPermissionUseCase(
       repository: sl<PerMissionRequestRepository>(),
     ),
   );
   sl.registerLazySingleton(
         () => PostPermissionUseCase(repository: sl<PerMissionRequestRepository>()),
   );
 }