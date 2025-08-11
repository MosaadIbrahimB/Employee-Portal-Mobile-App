import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/response_mission_model.dart';
import '../repository/mission_repository.dart';

class GetReviewerMissionUseCase {
  MissionRequestRepository repository;

  GetReviewerMissionUseCase({required this.repository});

  Future<Either<Failure, List<ResponseMissionModel>>> call() async {
    return await repository.getReviewerMissionRequests();
  }
}
