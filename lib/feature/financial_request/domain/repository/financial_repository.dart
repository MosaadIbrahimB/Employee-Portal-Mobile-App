import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/model/financial_request_type_model.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/model/request_post_financial_request_model.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/model/response_financial_model.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/model/response_post_financial_request.dart';
import '../../../../core/error/failure.dart';

abstract class FinancialRequestRepository {
  Future<Either<Failure, List<FinancialRequestTypeModel>>>
  getFinancialRequestType();

  Future<Either<Failure, List<ResponseFinancialModel>>>
  getEmployeeFinancialRequest();

  Future<Either<Failure, List<ResponseFinancialModel>>>
  getReviewerFinancialRequest();

  Future<Either<Failure, ResponsePostFinancialRequest>> postFinancialRequest({
    required RequestPostFinancialRequestModel requestPostFinancialRequestModel,
  });
}
