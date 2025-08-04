import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/core/error/failure.dart';
import 'package:employee_portal_mobile_app/feature/request/data/model/financial_request_type_model.dart';

import '../../data/model/request_post_administrative_request_model.dart';
import '../../data/model/response_admin_financial_model.dart';
import '../../data/model/response_post_administrative_request.dart';

abstract class RequestRepository {
  Future<Either<Failure, List<FinancialRequestTypeModel>>>
  getFinancialRequestType();

  Future<Either<Failure, List<FinancialRequestTypeModel>>> getAdminRequestType();

  Future<Either<Failure, List<ResponseAdminFinancialModel>>>
  getEmployeeAdministrativeRequest();


  Future<Either<Failure, List<ResponseAdminFinancialModel>>>
  getReviewerAdministrativeRequest();

  Future<Either<Failure, ResponsePostAdministrativeRequest>> postAdministrativeRequest({
    required RequestPostAdministrativeRequestModel requestPostAdministrativeRequestModel,
  });
}
