import 'package:employee_portal_mobile_app/core/service/api_service/dio_consumer.dart';
import 'package:employee_portal_mobile_app/feature/mission_request/data/data_source/remote/mission_request_remote_data_source.dart';
import 'package:employee_portal_mobile_app/feature/mission_request/data/model/post_mission/post_mission_request_model.dart';
import 'package:employee_portal_mobile_app/feature/mission_request/data/model/post_mission/response_post_mission_model.dart';
import '../../../../../core/utils/end_point.dart';
import '../../model/response_mission_model.dart';

class MissionRequestRemoteDataSourceImpl implements MissionRequestRemoteDataSource {
  final DioConsumer apiService;

  MissionRequestRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<ResponseMissionModel>> getMission() async {
    final response = await apiService.get(endPoint: EndPoint.getMission);

    final financialList =
        response.data
            .map<ResponseMissionModel>(
              (json) => ResponseMissionModel.fromJson(json),
            )
            .toList();

    return ResponseMissionModel.listMission;
    return financialList;
  }

  @override
  Future<List<ResponseMissionModel>> getReviewerMissionRequests() async {
    final responseReviewed = await apiService.get(
      endPoint: EndPoint.getReviewerReviewedMissionRequests,
    );
    final listReviewed =
        responseReviewed.data
            .map<ResponseMissionModel>(
              (json) => ResponseMissionModel.fromJson(json),
            )
            .toList();

    final responsePending = await apiService.get(
      endPoint: EndPoint.getReviewerNotReviewedMissionRequests,
    );
    final listPending =
        responsePending.data
            .map<ResponseMissionModel>(
              (json) => ResponseMissionModel.fromJson(json),
            )
            .toList();

    return [...listReviewed, ...listPending];

    // return ResponseMissionModel.listMission;
  }

  @override
  Future<List<ResponseMissionModel>> getEmployeeMissionRequests() async {
    final responseReviewed = await apiService.get(
      endPoint: EndPoint.getEmployeeReviewedMissionRequests,
    );
    final listReviewed =
        responseReviewed.data
            .map<ResponseMissionModel>(
              (json) => ResponseMissionModel.fromJson(json),
            )
            .toList();

    final responsePending = await apiService.get(
      endPoint: EndPoint.getEmployeeNotReviewedMissionRequests,
    );
    final listPending =
        responsePending.data
            .map<ResponseMissionModel>(
              (json) => ResponseMissionModel.fromJson(json),
            )
            .toList();

    return [...listReviewed, ...listPending];
  }

  @override
  Future<ResponsePostMissionModel> postMissionRequests(
    RequestPostMissionModel postMissionRequestModel,
  ) async {
    final response = await apiService.post(endPoint: EndPoint.postMission, data: postMissionRequestModel.toJson());
    return ResponsePostMissionModel.fromJson(response.data);
  }

}
