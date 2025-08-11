import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/response_mission_model.dart';

abstract class MissionRequestRepository {
  Future<Either<Failure, List<ResponseMissionModel>>> getMission();
  Future<Either<Failure, List<ResponseMissionModel>>> getReviewerMissionRequests();
  Future<Either<Failure, List<ResponseMissionModel>>> getEmployeeMissionRequests();
}
