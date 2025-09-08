import '../../../../feature/financial_request/domain/use_case/get_employee_financial_use_case.dart';
import '../../../../feature/financial_request/domain/use_case/get_financial_request_type_use_case.dart';
import '../../../../feature/financial_request/domain/use_case/get_reviewer_financial_request_use_case.dart';
import '../../../../feature/financial_request/domain/use_case/post_financial_request_use_case.dart';
import '../../../../feature/financial_request/presentation/control/financial_request_type/get_financial_request_type_cubit.dart';
import '../../../../feature/financial_request/presentation/control/get_employee_financial_request/get_employee_financial_request_cubit.dart';
import '../../../../feature/financial_request/presentation/control/get_reviewer_financial_request/get_reviewer_financial_request_cubit.dart';
import '../../../../feature/financial_request/presentation/control/post_financial_request/post_financial_request_cubit.dart';
import '../depend_inject.dart';
void initFinancialCubit() {

  sl.registerFactory(
        () => GetEmployeeFinancialRequestCubit(
      getEmployeeFinancialRequestUseCase: sl<GetEmployeeFinancialUseCase>(),
    ),
  );
  sl.registerFactory(
        () => GetReviewerFinancialRequestCubit(
      getReviewerFinancialRequestUseCase:
      sl<GetReviewerFinancialRequestUseCase>(),
    ),
  );
  sl.registerFactory(
        () => GetFinancialRequestTypeCubit(
      getFinancialRequestUseCase: sl<GetFinancialRequestTypeUseCase>(),
    ),
  );
  sl.registerFactory(
        () => PostFinancialRequestCubit(sl<PostFinancialRequestUseCase>()),
  );

}