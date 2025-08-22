import 'package:employee_portal_mobile_app/core/service/api_service/api_service.dart' ;
import 'package:employee_portal_mobile_app/feature/permission_request/data/data_source/remote/permission_request_remote_data_source.dart';
import 'package:employee_portal_mobile_app/feature/permission_request/data/model/get_allowed_permission_model.dart';
import 'package:employee_portal_mobile_app/feature/permission_request/data/model/get_permissions_model.dart';
import 'package:employee_portal_mobile_app/feature/permission_request/data/model/post/request_post_permission_model.dart';
import 'package:employee_portal_mobile_app/feature/permission_request/data/model/post/response_post_permission_model.dart';
import 'package:employee_portal_mobile_app/feature/permission_request/data/model/response_permission_request_model.dart';

import '../../../../../core/utils/end_point.dart';

class PermissionRequestRemoteDataSourceImpl implements PermissionRequestRemoteDataSource {
  final ApiService apiService;

  PermissionRequestRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<GetAllowedPermissionModel>> getAllowedPermission()
  async {
    final response = await apiService.getRequest(
      endPoint: EndPoint.getAllowedPermission,
    );

    final list =
    response.data
        .map<GetAllowedPermissionModel>(
          (json) => GetAllowedPermissionModel.fromJson(json),
    )
        .toList();

    return list;
  }


  @override
  Future<List<ResponsePermissionRequestModel>> getEmployeePermissionRequest()
  async {
    final responseReviewed = await apiService.getRequest(
      endPoint: EndPoint.getEmployeeTrue,
    );
    final listReviewed =
    responseReviewed.data
        .map<ResponsePermissionRequestModel>(
          (json) => ResponsePermissionRequestModel.fromJson(json),
    )
        .toList();

    final responsePending = await apiService.getRequest(
      endPoint: EndPoint.getEmployeeFalse,
    );
    final listPending =
    responsePending.data
        .map<ResponsePermissionRequestModel>(
          (json) => ResponsePermissionRequestModel.fromJson(json),
    )
        .toList();

    return [
      ...listReviewed,
      ...listPending,
    ];

  }


  @override
  Future<List<GetPermissionsModel>> getPermissions()
  async {
    final response = await apiService.getRequest(
      endPoint: EndPoint.getPermission,
    );

    final list =
    response.data
        .map<GetPermissionsModel>(
          (json) => GetPermissionsModel.fromJson(json),
    )
        .toList();

    return list;
  }


  @override
  Future<List<ResponsePermissionRequestModel>> getReviewerPermissionRequest()
  async {
    final responseReviewed = await apiService.getRequest(
      endPoint: EndPoint.getReviewerTrue,
    );
    final listReviewed =
    responseReviewed.data
        .map<ResponsePermissionRequestModel>(
          (json) => ResponsePermissionRequestModel.fromJson(json),
    )
        .toList();

    final responsePending = await apiService.getRequest(
      endPoint: EndPoint.getReviewerFalse,
    );
    final listPending =
    responsePending.data
        .map<ResponsePermissionRequestModel>(
          (json) => ResponsePermissionRequestModel.fromJson(json),
    )
        .toList();

    return [
      ...listReviewed,
      ...listPending,
    ];

  }

  @override
  Future<ResponsePostPermissionModel> postPermissionRequest({ required RequestPostPermissionModel requestPostPermissionModel})
  async {
    final response = await apiService.postRequest(
      endPoint: EndPoint.postRequest,
      data: requestPostPermissionModel.toJson(),
    );
    return ResponsePostPermissionModel.fromJson(response.data);
  }




}
