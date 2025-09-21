import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/get_loan_model.dart';
import '../../data/model/loan_type_model.dart';
import '../../data/model/post/post_loan_request_model.dart';
import '../../data/model/post/post_loan_response_model.dart';
import '../../data/model/response_loan_model.dart';
import '../../data/model/valid/validate_loan_request_model.dart';
import '../../data/model/valid/validate_loan_response_model.dart';

abstract class LoanRepository {
  Future<Either<Failure,List<GetLoanModel>>> getLoan();
  Future<Either<Failure,List<LoanModel>>> getEmployeeLoan();
  Future<Either<Failure,List<LoanModel>>> getReviewerLoan();
  Future<Either<Failure,List<LoanTypeModel>>> getLoanType();
  Future<Either<Failure,ValidateLoanResponseModel>> validateLoan({
    required ValidateLoanRequestModel requestModel,
  });
  Future<Either<Failure,PostLoanResponseModel>> postLoan({
    required  PostLoanRequestModel requestPostLoanModel,
  });

}