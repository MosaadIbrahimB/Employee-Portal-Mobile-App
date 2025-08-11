
import '../../../../mission_request/model/response_mission_model.dart';
import '../../../../mission_request/model/response_get_review_mission_request_model.dart';

abstract class MissionRequestRemoteDataSource {
  Future<List<ResponseMissionModel>> getMission();
  Future<List<ResponseGetReviewMissionRequestModel>> getReviewerMissionRequests();
  Future<List<ResponseGetReviewMissionRequestModel>> getEmployeeMissionRequests();

}
