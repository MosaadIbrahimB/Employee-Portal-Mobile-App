import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/loan_type_model.dart';
import '../repository/loan_repository.dart';

class GetLoanTypeUseCase{
  final LoanRepository repository;

  GetLoanTypeUseCase(this.repository);

  Future<Either<Failure, List<LoanTypeModel>>> call() {
    return repository.getLoanType();
  }
}
