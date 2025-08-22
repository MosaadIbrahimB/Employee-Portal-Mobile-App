import '../../model/get_allowed_permission_model.dart';
import '../../model/get_permissions_model.dart';
import '../../model/post/request_post_permission_model.dart';
import '../../model/post/response_post_permission_model.dart';
import '../../model/response_permission_request_model.dart';
abstract class PermissionRequestRemoteDataSource {

  Future<List<GetPermissionsModel>> getPermissions();
  Future<List<GetAllowedPermissionModel>> getAllowedPermission();
  Future<List<ResponsePermissionRequestModel>> getEmployeePermissionRequest();
  Future<List<ResponsePermissionRequestModel>> getReviewerPermissionRequest();
  Future<ResponsePostPermissionModel> postPermissionRequest({
    required  RequestPostPermissionModel requestPostPermissionModel,
  });
}
