import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/model/response_financial_model.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/domain/repository/financial_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../request/data/model/response_admin_financial_model.dart';
import '../../../request/domain/repository/request_repository.dart';

class GetReviewerFinancialRequestUseCase {
  FinancialRequestRepository repository;


  GetReviewerFinancialRequestUseCase({required this.repository});


  Future<Either<Failure, List<ResponseFinancialModel>>>
  call() async {
    return await repository.getReviewerFinancialRequest();
  }

}
