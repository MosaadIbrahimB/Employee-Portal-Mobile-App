import '../../../../feature/permission_request/domain/use_case/get_allowed_permission_use_case.dart';
import '../../../../feature/permission_request/domain/use_case/get_employee_permission_request_use_case.dart';
import '../../../../feature/permission_request/domain/use_case/get_permission_use_case.dart';
import '../../../../feature/permission_request/domain/use_case/get_reviewer_permission_use_case.dart';
import '../../../../feature/permission_request/domain/use_case/post_permission_use_case.dart';
import '../../../../feature/permission_request/presentation/control/get_allowed_permission/get_allowed_permission_cubit.dart';
import '../../../../feature/permission_request/presentation/control/get_employee_permission/get_employee_permission_cubit.dart';
import '../../../../feature/permission_request/presentation/control/get_permission_request/get_permission_request_cubit.dart';
import '../../../../feature/permission_request/presentation/control/get_reviewer_permission/get_reviewer_permission_cubit.dart';
import '../../../../feature/permission_request/presentation/control/post_permission_request/post_permission_request_cubit.dart';
import '../depend_inject.dart';

void initPermissionCubit() {
  sl.registerFactory(
        () => GetAllowedPerMissionRequestCubit(getUseCase: sl<GetAllowedPermissionUseCase>()),
  );
  sl.registerFactory(
        () => GetEmployeePerMissionRequestCubit(getUseCase: sl<GetEmployeePermissionRequestUseCase>()),
  );

  sl.registerFactory(
        () => GetPerMissionRequestCubit(getUseCase: sl<GetPerMissionUseCase>()),
  );

  sl.registerFactory(
        () => GetReviewerPerMissionRequestCubit(getUseCase: sl<GetReviewerPermissionUseCase>()),
  );

  sl.registerFactory(
        () => PostPerMissionRequestCubit( sl<PostPermissionUseCase>()),
  );
}
