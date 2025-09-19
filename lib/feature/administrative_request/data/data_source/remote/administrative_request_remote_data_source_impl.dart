
import 'package:employee_portal_mobile_app/core/service/api_service/dio_consumer.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/data/data_source/remote/administrative_request_remote_data_source.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/data/model/administrative_request_type_model.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/data/model/request_post_administrative_request_model.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/data/model/response_administrative_model.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/data/model/response_post_administrative_request.dart';

import '../../../../../core/utils/end_point.dart';

class AdministrativeRequestRemoteDataSourceImpl implements AdministrativeRequestRemoteDataSource {
  final DioConsumer apiService;

  AdministrativeRequestRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<AdministrativeRequestTypeModel>> getAdministrativeRequestType()
  async {
    final response = await apiService.get(
      endPoint: EndPoint.getRequestAdministrative,
    );

    final List<AdministrativeRequestTypeModel> administrativeList =
    response.data
        .map<AdministrativeRequestTypeModel>(
          (json) => AdministrativeRequestTypeModel.fromJson(json),
    )
        .toList();

    return administrativeList;
  }

  @override
  Future<List<ResponseAdministrativeModel>> getEmployeeAdministrativeRequest()
  async {
    final responseReviewed = await apiService.get(
      endPoint: EndPoint.getEmployeeReviewedAdministrativeRequest,
    );
    final listReviewed =
    responseReviewed.data
        .map<ResponseAdministrativeModel>(
          (json) => ResponseAdministrativeModel.fromJson(json),
    )
        .toList();

    final responsePending = await apiService.get(
      endPoint: EndPoint.getEmployeePendingFinancialRequests,
    );
    final listPending =
    responsePending.data
        .map<ResponseAdministrativeModel>(
          (json) => ResponseAdministrativeModel.fromJson(json),
    )
        .toList();

    // return [
    //   ...listReviewed,
    //   ...listPending,
    // ];
    return ResponseAdministrativeModel.sampleAdministrativeRequests;

  }


  @override
  Future<List<ResponseAdministrativeModel>> getReviewerAdministrativeRequest()
  async {
    final responseReviewed = await apiService.get(
      endPoint: EndPoint.getReviewerReviewedAdministrativeRequest,
    );
    final listReviewed =
    responseReviewed.data
        .map<ResponseAdministrativeModel>(
          (json) => ResponseAdministrativeModel.fromJson(json),
    )
        .toList();

    final responsePending = await apiService.get(
      endPoint: EndPoint.getReviewerPendingFinancialRequests,
    );
    final listPending =
    responsePending.data
        .map<ResponseAdministrativeModel>(
          (json) => ResponseAdministrativeModel.fromJson(json),
    )
        .toList();

    // return [
    //   ...listReviewed,
    //   ...listPending,
    // ];

    return ResponseAdministrativeModel.sampleAdministrativeRequests;
  }


  @override
  Future<ResponsePostAdministrativeRequest> postAdministrativeRequest({required RequestPostAdministrativeRequestModel requestPostAdministrativeRequestModel})
  async {
    final response = await apiService.post(
      endPoint: EndPoint.postRequest,
      data: requestPostAdministrativeRequestModel.toJson(),
    );
    return ResponsePostAdministrativeRequest.fromJson(response.data);
  }



}
