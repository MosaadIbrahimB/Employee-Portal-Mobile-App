import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/response_loan_model.dart';
import '../repository/loan_repository.dart';


class GetReviewerLoanUseCase {
  final LoanRepository repository;

  GetReviewerLoanUseCase(this.repository);

  Future<Either<Failure, List<LoanModel>>> call() {
    return repository.getReviewerLoan();
  }
}
