import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/get_loan_model.dart';
import '../repository/loan_repository.dart';

class GetLoanUseCase {
  final LoanRepository repository;
  GetLoanUseCase(this.repository);

  Future<Either<Failure, List<GetLoanModel>>> call() {
    return repository.getLoan();
  }
}
