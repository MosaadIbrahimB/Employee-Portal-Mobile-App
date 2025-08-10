import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/core/error/failure.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/model/request_post_financial_request_model.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/model/response_post_financial_request.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/domain/repository/financial_repository.dart';


class PostFinancialRequestUseCase {
  FinancialRequestRepository repository;


  PostFinancialRequestUseCase({required this.repository});


  Future<Either<Failure, ResponsePostFinancialRequest>> call({
    required RequestPostFinancialRequestModel requestPostFinancialRequestModel,
  })
  async {
    return await repository.postFinancialRequest(requestPostFinancialRequestModel: requestPostFinancialRequestModel);
  }

}
