import '../../../../feature/loan/domain/repository/loan_repository.dart';
import '../../../../feature/loan/domain/use_case/get_employee_loan_use_case.dart';
import '../../../../feature/loan/domain/use_case/get_loan_type_use_case.dart';
import '../../../../feature/loan/domain/use_case/get_loan_use_case.dart';
import '../../../../feature/loan/domain/use_case/get_reviewer_loan_use_case.dart';
import '../../../../feature/loan/domain/use_case/post_loan_use_case.dart';
import '../../../../feature/loan/domain/use_case/validate_loan_use_case.dart';
import '../depend_inject.dart';

initLoanUseCase(){
  sl.registerLazySingleton(() => GetEmployeeLoanUseCase(sl<LoanRepository>()));
  sl.registerLazySingleton(() => GetLoanTypeUseCase(sl<LoanRepository>()));
  sl.registerLazySingleton(() => GetLoanUseCase(sl<LoanRepository>()));
  sl.registerLazySingleton(() => GetReviewerLoanUseCase(sl<LoanRepository>()));
  sl.registerLazySingleton(() => PostLoanUseCase(sl<LoanRepository>()));
  sl.registerLazySingleton(() => ValidateLoanUseCase(sl<LoanRepository>()));
}