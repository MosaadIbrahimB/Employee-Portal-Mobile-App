import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/get_allowed_permission_model.dart';

import '../repository/permission_repository.dart';


class GetAllowedPermissionUseCase {
  PerMissionRequestRepository repository;

  GetAllowedPermissionUseCase({required this.repository});

  Future<Either<Failure, List<GetAllowedPermissionModel>>> call() async {
    return await repository.getAllowedPermission();
  }
}
