import 'package:employee_portal_mobile_app/core/service/api_service/api_service.dart';
import 'package:employee_portal_mobile_app/feature/over_time/data/model/alert_model.dart';
import 'package:employee_portal_mobile_app/feature/permission_request/data/data_source/remote/permission_request_remote_data_source.dart';
import 'package:employee_portal_mobile_app/feature/permission_request/data/model/get_allowed_permission_model.dart';
import 'package:employee_portal_mobile_app/feature/permission_request/data/model/get_permissions_model.dart';
import 'package:employee_portal_mobile_app/feature/permission_request/data/model/post/request_post_permission_model.dart';
import 'package:employee_portal_mobile_app/feature/permission_request/data/model/post/response_post_permission_model.dart';
import 'package:employee_portal_mobile_app/feature/permission_request/data/model/response_permission_request_model.dart';

import '../../../../../core/utils/end_point.dart';
import '../../model/post/request_post_over_time_model.dart';
import '../../model/post/response_post_over_time_model.dart';
import '../../model/request_alert_model.dart';
import '../../model/response_over_time_model.dart';
import 'over_time_remote_data_source.dart';

class OverTimeRequestRemoteDataSourceImpl
    implements OverTimeRequestRemoteDataSource {
  final ApiService apiService;

  OverTimeRequestRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<ResponseOverTimeModel>> getEmployeeOverTimeRequest()
  async {
    final responseReviewed = await apiService.getRequest(
      endPoint: EndPoint.getEmployeeOvertimeTrue,
    );
    final listReviewed =
        responseReviewed.data
            .map<ResponseOverTimeModel>(
              (json) => ResponseOverTimeModel.fromJson(json),
            )
            .toList();

    final responsePending = await apiService.getRequest(
      endPoint: EndPoint.getEmployeeOvertimeFalse,
    );
    final listPending =
        responsePending.data
            .map<ResponseOverTimeModel>(
              (json) => ResponseOverTimeModel.fromJson(json),
            )
            .toList();

    return [...listReviewed, ...listPending];
  }

  @override
  Future<List<ResponseOverTimeModel>> getReviewerOverTimeRequest()
  async {
    final responseReviewed = await apiService.getRequest(
      endPoint: EndPoint.getReviewerOvertimeTrue,
    );
    final listReviewed =
        responseReviewed.data
            .map<ResponseOverTimeModel>(
              (json) => ResponseOverTimeModel.fromJson(json),
            )
            .toList();

    final responsePending = await apiService.getRequest(
      endPoint: EndPoint.getReviewerOvertimeFalse,
    );
    final listPending =
        responsePending.data
            .map<ResponseOverTimeModel>(
              (json) => ResponseOverTimeModel.fromJson(json),
            )
            .toList();
    return [...listReviewed, ...listPending];
  }

  @override
  Future<ResponsePostOverTimeModel> postOverTimeRequest({
    required RequestPostOverTimeModel requestPostOverTimeModel,
  })
  async {
    final response = await apiService.postRequest(
      endPoint: EndPoint.postOvertime,
      data: requestPostOverTimeModel.toJson(),
    );
    return ResponsePostOverTimeModel.fromJson(response.data);
  }

  @override
  Future<AlertModel> getAlertOverTimeRequest({
    required RequestAlertModel requestAlertModel,
    int? id,
  })
  async {
    final response = await apiService.getRequestWithBody(
      endPoint: EndPoint.getAlert,
      data: requestAlertModel.toJson(),
      queryParams: {'id': id??0},
    );
    return AlertModel.fromJson(response.data);
  }

  @override
  Future<List<AlertModel>> getAlertsOverTimeRequest({
    required RequestAlertModel requestAlertModel,
    String ?fromDate,
    String ?toDate,
  })
  async {
    final response = await apiService.getRequestWithBody(
      endPoint: EndPoint.getAlerts,
      data: requestAlertModel.toJson(),
      queryParams: {
        if (fromDate != null) 'fromDate': fromDate,
        if (toDate != null) 'toDate': toDate,
      },

    );

    List<AlertModel> list =
        response.data
            .map<AlertModel>((json) => AlertModel.fromJson(json))
            .toList();

    return list;
  }
}
