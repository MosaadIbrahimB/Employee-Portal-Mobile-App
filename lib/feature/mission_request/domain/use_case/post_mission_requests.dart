import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/feature/mission_request/data/model/post_mission/post_mission_request_model.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/post_mission/response_post_mission_model.dart';
import '../../data/model/response_mission_model.dart';
import '../repository/mission_repository.dart';

class PostMissionUseCase {
  MissionRequestRepository repository;

  PostMissionUseCase({required this.repository});

  Future<Either<Failure, ResponsePostMissionModel>> call(RequestPostMissionModel requestMission)
  async {
    return await repository.postMissionRequests(requestMission);
  }
}
