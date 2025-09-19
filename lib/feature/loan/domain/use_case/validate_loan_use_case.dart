import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/valid/validate_loan_request_model.dart';
import '../../data/model/valid/validate_loan_response_model.dart';
import '../repository/loan_repository.dart';

class ValidateLoanUseCase {
  final LoanRepository repository;

  ValidateLoanUseCase(this.repository);

  Future<Either<Failure, ValidateLoanResponseModel>> call({

    required  ValidateLoanRequestModel requestModel
}
      ) {
    return repository.validateLoan(requestModel: requestModel);
  }
}
