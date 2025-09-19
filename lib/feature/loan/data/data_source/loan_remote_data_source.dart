import '../model/get_loan_model.dart';
import '../model/loan_type_model.dart';
import '../model/post/post_loan_request_model.dart';
import '../model/post/post_loan_response_model.dart';
import '../model/response_loan_model.dart';
import '../model/valid/validate_loan_request_model.dart';
import '../model/valid/validate_loan_response_model.dart';

abstract class LoanRemoteDataSource {
  Future<List<GetLoanModel>> getLoan();
  Future<List<LoanModel>> getEmployeeLoan();
  Future<List<LoanModel>> getReviewerLoan();
  Future<List<LoanTypeModel>> getLoanType();
  Future<ValidateLoanResponseModel> validateLoan({
    required ValidateLoanRequestModel requestModel,
  });
  Future<List<PostLoanResponseModel>> postLoan({
    required  PostLoanRequestModel requestPostLoanModel,
  });
}

