
import '../../../../feature/administrative_request/domain/repository/administrative_repository.dart';
import '../../../../feature/administrative_request/domain/use_case/get_administrative_request_type_use_case.dart';
import '../../../../feature/administrative_request/domain/use_case/get_employee_administrative_use_case.dart';
import '../../../../feature/administrative_request/domain/use_case/get_reviewer_administrative_request_use_case.dart';
import '../../../../feature/administrative_request/domain/use_case/post_administrative_request_use_case.dart';
import '../depend_inject.dart';

initAdminUseCase(){
  sl.registerLazySingleton(
        () => GetAdministrativeRequestTypeUseCase(
      repository: sl<AdministrativeRequestRepository>(),
    ),
  );
  sl.registerLazySingleton(
        () => GetEmployeeAdministrativeUseCase(
      repository: sl<AdministrativeRequestRepository>(),
    ),
  );
  sl.registerLazySingleton(
        () => GetReviewerAdministrativeRequestUseCase(
      repository: sl<AdministrativeRequestRepository>(),
    ),
  );
  sl.registerLazySingleton(
        () => PostAdministrativeRequestUseCase(
      repository: sl<AdministrativeRequestRepository>(),
    ),
  );
}