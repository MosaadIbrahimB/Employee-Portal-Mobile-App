import 'package:employee_portal_mobile_app/feature/request/data/model/financial_request_type_model.dart';
import '../../model/mission_model/response_get_mission_model.dart';
import '../../model/mission_model/response_get_review_mission_request_model.dart';
import '../../model/request_post_administrative_request_model.dart';
import '../../model/response_admin_financial_model.dart';
import '../../model/response_post_administrative_request.dart';

abstract class RequestRemoteDataSource {
  Future<List<FinancialRequestTypeModel>> getAdminRequestType();
  Future<List<ResponseAdminFinancialModel>> getEmployeeAdministrativeRequest();
  Future<List<ResponseAdminFinancialModel>> getReviewerAdministrativeRequest();
  Future<ResponsePostAdministrativeFinancialRequest> postAdministrativeRequest({
    required RequestPostAdministrativeFinancialRequestModel requestPostAdministrativeRequestModel,
  });
  //Financial
  Future<List<FinancialRequestTypeModel>> getFinancialRequestType();
  Future<List<ResponseAdminFinancialModel>> getEmployeeFinancialRequest();
  Future<List<ResponseAdminFinancialModel>>  getReviewerFinancialRequest();
//mission
  Future<List<ResponseGetMissionModel>> getMission();
  Future<List<ResponseGetReviewMissionRequestModel>> getReviewerMissionRequests();
  Future<List<ResponseGetReviewMissionRequestModel>> getEmployeeMissionRequests();


}

