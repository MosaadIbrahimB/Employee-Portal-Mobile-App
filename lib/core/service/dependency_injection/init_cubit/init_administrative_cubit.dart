import '../../../../feature/administrative_request/domain/use_case/get_administrative_request_type_use_case.dart';
import '../../../../feature/administrative_request/domain/use_case/get_employee_administrative_use_case.dart';
import '../../../../feature/administrative_request/domain/use_case/get_reviewer_administrative_request_use_case.dart';
import '../../../../feature/administrative_request/domain/use_case/post_administrative_request_use_case.dart';
import '../../../../feature/administrative_request/presentation/control/administrative_request_type/get_administrative_request_type_cubit.dart';
import '../../../../feature/administrative_request/presentation/control/get_employee_administrative_request/get_employee_administrative_request_cubit.dart';
import '../../../../feature/administrative_request/presentation/control/get_reviewer_administrative_request/get_reviewer_administrative_request_cubit.dart';
import '../../../../feature/administrative_request/presentation/control/post_administrative_request/post_administrative_request_cubit.dart';
import '../depend_inject.dart';

void initAdministrativeCubit(){
  sl.registerFactory(
        () => GetAdministrativeRequestTypeCubit(
      getAdministrativeRequestUseCase:
      sl<GetAdministrativeRequestTypeUseCase>(),
    ),
  );
  sl.registerFactory(
        () => GetEmployeeAdministrativeRequestCubit(
      getEmployeeAdministrativeRequestUseCase:
      sl<GetEmployeeAdministrativeUseCase>(),
    ),
  );
  sl.registerFactory(
        () => GetReviewerAdministrativeRequestCubit(
      getReviewerAdministrativeRequestUseCase:
      sl<GetReviewerAdministrativeRequestUseCase>(),
    ),
  );
  sl.registerFactory(
        () =>
        PostAdministrativeRequestCubit(sl<PostAdministrativeRequestUseCase>()),
  );
}