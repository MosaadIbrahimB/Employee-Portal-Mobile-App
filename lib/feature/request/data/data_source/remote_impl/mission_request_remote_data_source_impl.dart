import '../../../../../core/service/api_service/api_service.dart';
import '../../../../../core/utils/end_point.dart';
import '../../../../mission_request/model/response_mission_model.dart';
import '../../../../mission_request/model/response_get_review_mission_request_model.dart';
import '../remote/mission_request_remote_data_source.dart';

class MissionRequestRemoteDataSourceImpl implements MissionRequestRemoteDataSource {
  final ApiService apiService;

  MissionRequestRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<ResponseMissionModel>> getMission() async {
    final response = await apiService.getRequest(endPoint: EndPoint.getMission);

    final list =
    response.data
        .map<ResponseMissionModel>(
          (json) => ResponseMissionModel.fromJson(json),
    )
        .toList();

    return list;
  }

  @override
  Future<List<ResponseGetReviewMissionRequestModel>>
  getReviewerMissionRequests() async {
    final responseReviewerNotReviewed = await apiService.getRequest(
      endPoint: EndPoint.getReviewerNotReviewedMissionRequests,
    );

    final listReviewerNotReviewed =
    responseReviewerNotReviewed.data
        .map<ResponseGetReviewMissionRequestModel>(
          (json) => ResponseGetReviewMissionRequestModel.fromJson(json),
    )
        .toList();

    final responseReviewerReviewed = await apiService.getRequest(
      endPoint: EndPoint.getReviewerReviewedMissionRequests,
    );

    final listReviewerReviewed =
    responseReviewerReviewed.data
        .map<ResponseGetReviewMissionRequestModel>(
          (json) => ResponseGetReviewMissionRequestModel.fromJson(json),
    )
        .toList();

    return [...listReviewerNotReviewed, ...listReviewerReviewed];
  }

  @override
  Future<List<ResponseGetReviewMissionRequestModel>>
  getEmployeeMissionRequests() async {
    final responseEmployeeNotReviewed = await apiService.getRequest(
      endPoint: EndPoint.getEmployeeNotReviewedMissionRequests,
    );

    final listEmployeeNotReviewed =
    responseEmployeeNotReviewed.data
        .map<ResponseGetReviewMissionRequestModel>(
          (json) => ResponseGetReviewMissionRequestModel.fromJson(json),
    )
        .toList();

    final responseEmployeeReviewed = await apiService.getRequest(
      endPoint: EndPoint.getEmployeeReviewedMissionRequests,
    );
    final listEmployeeReviewed =
    responseEmployeeReviewed.data
        .map<ResponseGetReviewMissionRequestModel>(
          (json) => ResponseGetReviewMissionRequestModel.fromJson(json),
    )
        .toList();
    return [...listEmployeeNotReviewed, ...listEmployeeReviewed];
  }



}
