import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/response_admin_financial_model.dart';
import '../repository/request_repository.dart';

class GetReviewerFinancialRequestUseCase {
  RequestRepository requestRepository;


  GetReviewerFinancialRequestUseCase({required this.requestRepository});


  Future<Either<Failure, List<ResponseAdminFinancialModel>>> call() async {
    return await requestRepository.getReviewerFinancialRequest();
  }

}
