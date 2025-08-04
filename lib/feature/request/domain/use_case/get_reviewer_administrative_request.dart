import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/response_admin_financial_model.dart';
import '../repository/request_repository.dart';

class GetReviewerAdministrativeRequestUseCase {
  RequestRepository requestRepository;


  GetReviewerAdministrativeRequestUseCase({required this.requestRepository});


  Future<Either<Failure, List<ResponseAdminFinancialModel>>> call() async {
    return await requestRepository.getReviewerAdministrativeRequest();
  }

}
