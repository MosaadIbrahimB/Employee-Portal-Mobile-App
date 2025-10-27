import 'package:employee_portal_mobile_app/feature/over_time/data/model/alert_model.dart';
import 'package:employee_portal_mobile_app/feature/over_time/data/model/type_over_time_model.dart';
import '../../../../../core/service/api_service/api_consumer.dart';
import '../../../../../core/utils/end_point.dart';
import '../../model/post/request_post_over_time_model.dart';
import '../../model/post/response_post_over_time_model.dart';
import '../../model/response_over_time_model.dart';
import 'over_time_remote_data_source.dart';

class OverTimeRequestRemoteDataSourceImpl
    implements OverTimeRequestRemoteDataSource {
  final ApiConsumer apiService;

  OverTimeRequestRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<ResponseOverTimeModel>> getEmployeeOverTimeRequest()
  async {
    final responseReviewed = await apiService.get(
      endPoint: EndPoint.getEmployeeOvertimeTrue,
    );
    final listReviewed =
        responseReviewed.data
            .map<ResponseOverTimeModel>(
              (json) => ResponseOverTimeModel.fromJson(json),
            )
            .toList();

    final responsePending = await apiService.get(
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
    final responseReviewed = await apiService.get(
      endPoint: EndPoint.getReviewerOvertimeTrue,
    );
    final listReviewed =
        responseReviewed.data
            .map<ResponseOverTimeModel>(
              (json) => ResponseOverTimeModel.fromJson(json),
            )
            .toList();

    final responsePending = await apiService.get(
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
  Future<List<ResponsePostOverTimeModel>> postOverTimeRequest({
    required RequestPostOverTimeModel requestPostOverTimeModel,
  })
  async {
    final response = await apiService.post(
      endPoint: EndPoint.postOvertime,
      data: requestPostOverTimeModel.toJson(),
    );
    final list =
    response.data
        .map<ResponsePostOverTimeModel>(
          (json) => ResponsePostOverTimeModel.fromJson(json),
    )
        .toList();
    return list;
  }

  @override
  Future<AlertModel> getAlertOverTimeRequest({int? id})
  async {
    final response = await apiService.get(
      endPoint: EndPoint.getAlert,
      queryParams: {'id': id ?? 0},
    );
    return AlertModel.fromJson(response.data);
  }

  @override
  Future<List<AlertModel>> getAlertsOverTimeRequest({
    String? fromDate,
    String? toDate,
  })
  async {

    final response = await apiService.get(
      endPoint: EndPoint.getAlerts,
      queryParams: {
        if (fromDate != null) 'fromDate': fromDate,
        if (toDate != null) 'toDate': toDate,

      },
    );
    final List<AlertModel> list = response.data
        .expand((inner) => inner as List)
        .map<AlertModel>((json) => AlertModel.fromJson(json ))
        .toList();

    return list;
  }

  @override
  Future<List<TypeOverTimeModel>> getTypeOverTime()
  async {
    final response = await apiService.get(
      endPoint: EndPoint.getTypeOvertime,
    );

    final List<TypeOverTimeModel> overTimeList =
        response.data
            .map<TypeOverTimeModel>((json) => TypeOverTimeModel.fromJson(json))
            .toList();

    return overTimeList;
  }



}
