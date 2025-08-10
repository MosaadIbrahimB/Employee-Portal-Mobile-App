import 'package:employee_portal_mobile_app/feature/administrative_request/data/model/administrative_request_type_model.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/data/model/request_post_administrative_request_model.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/data/model/response_administrative_model.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/data/model/response_post_administrative_request.dart';

abstract class AdministrativeRequestRemoteDataSource {

  Future<List<AdministrativeRequestTypeModel>> getAdministrativeRequestType();
  Future<List<ResponseAdministrativeModel>> getEmployeeAdministrativeRequest();
  Future<List<ResponseAdministrativeModel>> getReviewerAdministrativeRequest();
  Future<ResponsePostAdministrativeRequest> postAdministrativeRequest({
    required RequestPostAdministrativeRequestModel requestPostAdministrativeRequestModel,
  });
}
