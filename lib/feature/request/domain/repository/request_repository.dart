import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/core/error/failure.dart';
import 'package:employee_portal_mobile_app/feature/request/data/model/financial_request_type_model.dart';

import '../../data/model/mission_model/response_get_mission_model.dart';
import '../../data/model/mission_model/response_get_review_mission_request_model.dart';
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

  Future<Either<Failure, ResponsePostAdministrativeFinancialRequest>> postAdministrativeFinancialRequest({
    required RequestPostAdministrativeFinancialRequestModel requestPostAdministrativeRequestModel,
  });

  Future<Either<Failure, List<ResponseAdminFinancialModel>>>
  getEmployeeFinancialRequest();

  Future<Either<Failure, List<ResponseAdminFinancialModel>>>
  getReviewerFinancialRequest();


//mission

  Future<Either<Failure,List<ResponseGetMissionModel>>> getMission();
  Future<Either<Failure,List<ResponseGetReviewMissionRequestModel>>> getReviewerMissionRequests();
  Future<Either<Failure,List<ResponseGetReviewMissionRequestModel>>> getEmployeeMissionRequests();




}
