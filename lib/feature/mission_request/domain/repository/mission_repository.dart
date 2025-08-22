import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/post_mission/post_mission_request_model.dart';
import '../../data/model/post_mission/response_post_mission_model.dart';
import '../../data/model/response_mission_model.dart';

abstract class MissionRequestRepository {
  Future<Either<Failure, List<ResponseMissionModel>>> getMission();
  Future<Either<Failure, List<ResponseMissionModel>>> getReviewerMissionRequests();
  Future<Either<Failure, List<ResponseMissionModel>>> getEmployeeMissionRequests();


  Future<Either<Failure,  ResponsePostMissionModel>>
  postMissionRequests(RequestPostMissionModel postMissionRequestModel);

}
