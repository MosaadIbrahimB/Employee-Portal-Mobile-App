import '../../model/mission_model/response_get_mission_model.dart';
import '../../model/mission_model/response_get_review_mission_request_model.dart';

abstract class MissionRequestRemoteDataSource {
  Future<List<ResponseGetMissionModel>> getMission();
  Future<List<ResponseGetReviewMissionRequestModel>> getReviewerMissionRequests();
  Future<List<ResponseGetReviewMissionRequestModel>> getEmployeeMissionRequests();

}
