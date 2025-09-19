import '../../../../feature/loan/domain/use_case/get_employee_loan_use_case.dart';
import '../../../../feature/loan/domain/use_case/get_loan_type_use_case.dart';
import '../../../../feature/loan/domain/use_case/get_loan_use_case.dart';
import '../../../../feature/loan/domain/use_case/get_reviewer_loan_use_case.dart';
import '../../../../feature/loan/domain/use_case/post_loan_use_case.dart';
import '../../../../feature/loan/domain/use_case/validate_loan_use_case.dart';
import '../../../../feature/loan/presentation/control/get_employee_loan/get_employee_loan_cubit.dart';
import '../../../../feature/loan/presentation/control/get_loan/get_loan_cubit.dart';
import '../../../../feature/loan/presentation/control/get_loan_type/get_loan_type_cubit.dart';
import '../../../../feature/loan/presentation/control/get_reviewer_loan/get_reviewer_loan_cubit.dart';
import '../../../../feature/loan/presentation/control/post_loan/post_loan_cubit.dart';
import '../../../../feature/loan/presentation/control/validate_loan/validate_loan_cubit.dart';
import '../depend_inject.dart';

initLoanCubit(){
  sl.registerFactory(() => GetEmployeeLoanCubit( getEmployeeLoanUseCase: sl<GetEmployeeLoanUseCase>()));
  sl.registerFactory(() => GetLoanCubit( getLoanUseCase: sl<GetLoanUseCase>()));
  sl.registerFactory(() => GetLoanTypeCubit( getLoanTypeUseCase: sl<GetLoanTypeUseCase>()));
  sl.registerFactory(() => GetReviewerLoanCubit(  getReviewerLoanUseCase: sl<GetReviewerLoanUseCase>()));
  sl.registerFactory(() => PostLoanCubit(  postLoanUseCase: sl<PostLoanUseCase>()));
  sl.registerFactory(() => ValidateLoanCubit(  validateLoanUseCase: sl<ValidateLoanUseCase>()));

}