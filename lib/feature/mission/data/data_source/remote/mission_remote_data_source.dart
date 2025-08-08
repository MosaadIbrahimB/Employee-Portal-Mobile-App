import 'package:employee_portal_mobile_app/feature/mission/data/model/response_get_review_mission_request_model.dart';

import '../../model/response_get_mission_model.dart';

abstract class MissionRemoteDataSource {
  Future<List<ResponseGetMissionModel>> getMission();
  Future<List<ResponseGetReviewMissionRequestModel>> getReviewerMissionRequests();
  Future<List<ResponseGetReviewMissionRequestModel>> getEmployeeMissionRequests();

  // Future<List<ResponseAdminFinancialModel>> getEmployeeAdministrativeRequest();
  // Future<List<ResponseAdminFinancialModel>> getReviewerAdministrativeRequest();
  // Future<ResponsePostAdministrativeFinancialRequest> postAdministrativeRequest({
  //   required RequestPostAdministrativeFinancialRequestModel requestPostAdministrativeRequestModel,
  // });
  // //Financial
  // Future<List<FinancialRequestTypeModel>> getFinancialRequestType();
  // Future<List<ResponseAdminFinancialModel>> getEmployeeFinancialRequest();
  // Future<List<ResponseAdminFinancialModel>>  getReviewerFinancialRequest();


}

