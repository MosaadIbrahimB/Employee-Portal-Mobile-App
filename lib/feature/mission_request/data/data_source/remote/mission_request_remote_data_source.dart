
import '../../model/response_mission_model.dart';

abstract class MissionRequestRemoteDataSource {
  Future<List<ResponseMissionModel>> getMission();
  Future<List<ResponseMissionModel>> getReviewerMissionRequests();
  Future<List<ResponseMissionModel>> getEmployeeMissionRequests();

}
