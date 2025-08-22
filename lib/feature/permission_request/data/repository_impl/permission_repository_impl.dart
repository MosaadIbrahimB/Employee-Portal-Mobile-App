import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/core/error/failure.dart';
import 'package:employee_portal_mobile_app/feature/permission_request/data/model/get_allowed_permission_model.dart';
import 'package:employee_portal_mobile_app/feature/permission_request/data/model/get_permissions_model.dart';
import 'package:employee_portal_mobile_app/feature/permission_request/data/model/post/request_post_permission_model.dart';
import 'package:employee_portal_mobile_app/feature/permission_request/data/model/post/response_post_permission_model.dart';
import 'package:employee_portal_mobile_app/feature/permission_request/data/model/response_permission_request_model.dart';
import '../../domain/repository/permission_repository.dart';
import '../data_source/remote/permission_request_remote_data_source.dart';

class PerMissionRepositoryImpl implements  PerMissionRequestRepository {
  PermissionRequestRemoteDataSource permissionRequestRemoteDataSource;

  PerMissionRepositoryImpl({
    required this.permissionRequestRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<GetPermissionsModel>>> getPermissions()
  async {
    try {
      final result =
      await permissionRequestRemoteDataSource.getPermissions();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e.toString()}حدث خطأ في الخادم getMission  "),
      );
    }
  }



  @override
  Future<Either<Failure, List<GetAllowedPermissionModel>>> getAllowedPermission()
  async {
    try {
      final result =
      await permissionRequestRemoteDataSource.getAllowedPermission();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e.toString()}حدث خطأ في الخادم getMission  "),
      );
    }
  }

  @override
  Future<Either<Failure, List<ResponsePermissionRequestModel>>> getEmployeePermissionRequest()
  async {
    try {
      final result =
      await permissionRequestRemoteDataSource.getEmployeePermissionRequest();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure(
            "${e.toString()}حدث خطأ في الخادم getEmployeeMissionRequests  "),
      );
    }
  }


  @override
  Future<Either<Failure, List<ResponsePermissionRequestModel>>> getReviewerPermissionRequest()
  async {
    try {
      final result =
      await permissionRequestRemoteDataSource.getReviewerPermissionRequest();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e.toString()}حدث خطأ في الخادم getMission  "),
      );
    }
  }

  @override
  Future<Either<Failure, ResponsePostPermissionModel>> postPermissionRequest(RequestPostPermissionModel requestPostPermissionModel)
  async {
    try {
      final result = await permissionRequestRemoteDataSource
          .postPermissionRequest(requestPostPermissionModel: requestPostPermissionModel);
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e
            .toString()}حدث خطأ في الخادم postMissionRequests  "),
      );
    }
  }


}


