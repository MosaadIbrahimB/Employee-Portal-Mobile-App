
import '../../../../feature/financial_request/domain/repository/financial_repository.dart';
import '../../../../feature/financial_request/domain/use_case/get_employee_financial_use_case.dart';
import '../../../../feature/financial_request/domain/use_case/get_financial_request_type_use_case.dart';
import '../../../../feature/financial_request/domain/use_case/get_reviewer_financial_request_use_case.dart';
import '../../../../feature/financial_request/domain/use_case/post_financial_request_use_case.dart';
import '../depend_inject.dart';

initFinancialUseCase() {
  sl.registerLazySingleton(
        () => GetEmployeeFinancialUseCase(
      repository: sl<FinancialRequestRepository>(),
    ),
  );
  sl.registerLazySingleton(
        () => GetFinancialRequestTypeUseCase(
      repository: sl<FinancialRequestRepository>(),
    ),
  );
  sl.registerLazySingleton(
        () => GetReviewerFinancialRequestUseCase(
      repository: sl<FinancialRequestRepository>(),
    ),
  );
  sl.registerLazySingleton(
        () => PostFinancialRequestUseCase(
      repository: sl<FinancialRequestRepository>(),
    ),
  );
}