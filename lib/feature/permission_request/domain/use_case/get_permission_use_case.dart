import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../repository/permission_repository.dart';

import '../../data/model/get_permissions_model.dart';

class GetPerMissionUseCase {
  PerMissionRequestRepository repository;

  GetPerMissionUseCase({required this.repository});

  Future<Either<Failure, List<GetPermissionsModel>>> call() async {
    return await repository.getPermissions();
  }
}
