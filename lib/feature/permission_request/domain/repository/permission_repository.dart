import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/get_allowed_permission_model.dart';
import '../../data/model/get_permissions_model.dart';
import '../../data/model/post/request_post_permission_model.dart';
import '../../data/model/post/response_post_permission_model.dart';
import '../../data/model/response_permission_request_model.dart';

abstract class PerMissionRequestRepository {
  Future<Either<Failure,List<GetPermissionsModel>>> getPermissions();
  Future<Either<Failure,List<GetAllowedPermissionModel>>> getAllowedPermission();

  Future<Either<Failure, List<ResponsePermissionRequestModel>>>
  getReviewerPermissionRequest();
  Future<Either<Failure, List<ResponsePermissionRequestModel>>> getEmployeePermissionRequest();

  Future<Either<Failure,  ResponsePostPermissionModel>>
  postPermissionRequest(RequestPostPermissionModel requestPostPermissionModel);

}

