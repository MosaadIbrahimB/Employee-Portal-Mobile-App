import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/post/post_loan_request_model.dart';
import '../../data/model/post/post_loan_response_model.dart';
import '../repository/loan_repository.dart';

class PostLoanUseCase {
  final LoanRepository repository;

  PostLoanUseCase(this.repository);

  Future<Either<Failure, PostLoanResponseModel>> call({
    required PostLoanRequestModel postLoanRequestModel,
  }) {
    return repository.postLoan(requestPostLoanModel: postLoanRequestModel);
  }
}
