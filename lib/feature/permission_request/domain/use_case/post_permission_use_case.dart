
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/post/request_post_permission_model.dart';
import '../../data/model/post/response_post_permission_model.dart';
import '../repository/permission_repository.dart';


class PostPermissionUseCase {
  PerMissionRequestRepository repository;

  PostPermissionUseCase({required this.repository});

  Future<Either<Failure,  ResponsePostPermissionModel>> call(RequestPostPermissionModel requestPostPermissionModel)
  async {
    return await repository.postPermissionRequest(requestPostPermissionModel);
  }
}
