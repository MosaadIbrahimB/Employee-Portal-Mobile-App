import '../../model/post_mission/post_mission_request_model.dart';
import '../../model/post_mission/response_post_mission_model.dart';
import '../../model/response_mission_model.dart';

abstract class MissionRequestRemoteDataSource {
  Future<List<ResponseMissionModel>> getMission();

  Future<List<ResponseMissionModel>> getReviewerMissionRequests();

  Future<List<ResponseMissionModel>> getEmployeeMissionRequests();

  Future<ResponsePostMissionModel> postMissionRequests(
    RequestPostMissionModel postMissionRequestModel,
  );
}
