import 'package:employee_portal_mobile_app/core/service/api_service/api_service.dart';
import 'package:employee_portal_mobile_app/feature/mission_request/data/data_source/remote/mission_request_remote_data_source.dart';
import '../../../../../core/utils/end_point.dart';
import '../../model/response_mission_model.dart';

class MissionRequestRemoteDataSourceImpl implements MissionRequestRemoteDataSource {
  final ApiService apiService;

  MissionRequestRemoteDataSourceImpl({required this.apiService});


  @override
  Future<List<ResponseMissionModel>> getMission()
  async {
    final response = await apiService.getRequest(
      endPoint: EndPoint.getMission,
    );

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
  Future<List<ResponseMissionModel>> getReviewerMissionRequests()
  async {
    final responseReviewed = await apiService.getRequest(
      endPoint: EndPoint.getReviewerReviewedMissionRequests,
    );
    final listReviewed =
    responseReviewed.data
        .map<ResponseMissionModel>(
          (json) => ResponseMissionModel.fromJson(json),
    )
        .toList();

    final responsePending = await apiService.getRequest(
      endPoint: EndPoint.getReviewerNotReviewedMissionRequests,
    );
    final listPending =
    responsePending.data
        .map<ResponseMissionModel>(
          (json) => ResponseMissionModel.fromJson(json),
    )
        .toList();

    return [
      ...listReviewed,
      ...listPending,
    ];

    // return ResponseFinancialModel.sampleFinancialRequests;
  }

  @override
  Future<List<ResponseMissionModel>> getEmployeeMissionRequests()
  async {
    final responseReviewed = await apiService.getRequest(
      endPoint: EndPoint.getEmployeeReviewedMissionRequests,
    );
    final listReviewed =
    responseReviewed.data
        .map<ResponseMissionModel>(
          (json) => ResponseMissionModel.fromJson(json),
    )
        .toList();

    final responsePending = await apiService.getRequest(
      endPoint: EndPoint.getEmployeeNotReviewedMissionRequests,
    );
    final listPending =
    responsePending.data
        .map<ResponseMissionModel>(
          (json) => ResponseMissionModel.fromJson(json),
    )
        .toList();

    return [
      ...listReviewed,
      ...listPending,
    ];

    // return ResponseFinancialModel.sampleFinancialRequests;
  }







}
