import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/data/model/administrative_request_type_model.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/data/model/request_post_administrative_request_model.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/data/model/response_administrative_model.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/data/model/response_post_administrative_request.dart';
import '../../../../core/error/failure.dart';

abstract class AdministrativeRequestRepository {
  Future<Either<Failure, List<AdministrativeRequestTypeModel>>>
  getAdministrativeRequestType();

  Future<Either<Failure, List<ResponseAdministrativeModel>>>
  getEmployeeAdministrativeRequest();

  Future<Either<Failure, List<ResponseAdministrativeModel>>>
  getReviewerAdministrativeRequest();

  Future<Either<Failure, ResponsePostAdministrativeRequest>> postAdministrativeRequest({
    required RequestPostAdministrativeRequestModel requestPostAdministrativeRequestModel,
  });
}
