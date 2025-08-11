import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/feature/mission_request/domain/repository/mission_repository.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/response_mission_model.dart';

class GetMissionUseCase {
  MissionRequestRepository repository;

  GetMissionUseCase({required this.repository});

  Future<Either<Failure, List<ResponseMissionModel>>> call() async {
    return await repository.getMission();
  }
}
