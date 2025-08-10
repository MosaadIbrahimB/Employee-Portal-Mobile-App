
import 'package:employee_portal_mobile_app/core/service/api_service/api_service.dart' ;
import 'package:employee_portal_mobile_app/feature/financial_request/data/data_source/remote/financial_request_remote_data_source.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/model/financial_request_type_model.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/model/request_post_financial_request_model.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/model/response_financial_model.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/model/response_post_financial_request.dart' show ResponsePostFinancialRequest;

import '../../../../../core/utils/end_point.dart';

class FinancialRequestRemoteDataSourceImpl implements FinancialRequestRemoteDataSource {
  final ApiService apiService;

  FinancialRequestRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<FinancialRequestTypeModel>> getFinancialRequestType() async {
    final response = await apiService.getRequest(
      endPoint: EndPoint.getRequestFinancial,
    );

    final financialList =
    response.data
        .map<FinancialRequestTypeModel>(
          (json) => FinancialRequestTypeModel.fromJson(json),
    )
        .toList();

    return financialList;
  }
  @override
  Future<ResponsePostFinancialRequest> postFinancialRequest({
    required RequestPostFinancialRequestModel requestPostFinancialRequestModel,
  })
  async {
    final response = await apiService.postRequest(
      endPoint: EndPoint.postRequest,
      data: requestPostFinancialRequestModel.toJson(),
    );
    return ResponsePostFinancialRequest.fromJson(response.data);
  }

  @override
  Future<List<ResponseFinancialModel>>
  getEmployeeFinancialRequest()
  async {
    final responseReviewed = await apiService.getRequest(
      endPoint: EndPoint.getEmployeeReviewedFinancialRequest,
    );
    final listReviewed =
    responseReviewed.data
        .map<ResponseFinancialModel>(
          (json) => ResponseFinancialModel.fromJson(json),
    )
        .toList();

    final responsePending = await apiService.getRequest(
      endPoint: EndPoint.getEmployeePendingFinancialRequests,
    );
    final listPending =
    responsePending.data
        .map<ResponseFinancialModel>(
          (json) => ResponseFinancialModel.fromJson(json),
    )
        .toList();

    // return [
    //   ...listReviewed,
    //   ...listPending,
    // ];

    return ResponseFinancialModel.sampleFinancialRequests;
  }

  @override
  Future<List<ResponseFinancialModel>>
  getReviewerFinancialRequest()
  async {
    final responseReviewed = await apiService.getRequest(
      endPoint: EndPoint.getReviewerReviewedFinancialRequests,
    );
    final listReviewed =
    responseReviewed.data
        .map<ResponseFinancialModel>(
          (json) => ResponseFinancialModel.fromJson(json),
    )
        .toList();

    final responsePending = await apiService.getRequest(
      endPoint: EndPoint.getReviewerPendingFinancialRequests,
    );
    final listPending =
    responsePending.data
        .map<ResponseFinancialModel>(
          (json) => ResponseFinancialModel.fromJson(json),
    )
        .toList();

    // return [
    //   ...listReviewed,
    //   ...listPending,
    // ];

    return ResponseFinancialModel.sampleFinancialRequests;
  }

}
