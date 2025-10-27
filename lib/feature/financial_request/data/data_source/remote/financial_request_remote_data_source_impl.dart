
import 'package:employee_portal_mobile_app/core/service/api_service/dio_consumer.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/data_source/remote/financial_request_remote_data_source.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/model/financial_request_type_model.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/model/request_post_financial_request_model.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/model/response_financial_model.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/model/response_post_financial_request.dart' show ResponsePostFinancialRequest;

import '../../../../../core/utils/end_point.dart';

class FinancialRequestRemoteDataSourceImpl implements FinancialRequestRemoteDataSource {
  final DioConsumer apiService;

  FinancialRequestRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<FinancialRequestTypeModel>> getFinancialRequestType()
  async {
    final response = await apiService.get(
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
    final response = await apiService.post(
      endPoint: EndPoint.postRequest,
      data: requestPostFinancialRequestModel.toJson(),
    );
    return ResponsePostFinancialRequest.fromJson(response.data);
  }

  @override
  Future<List<ResponseFinancialModel>>
  getEmployeeFinancialRequest()
  async {
    final responseReviewed = await apiService.get(
      endPoint: EndPoint.getEmployeeFinancialTrue,
    );
    final listReviewed =
    responseReviewed.data
        .map<ResponseFinancialModel>(
          (json) => ResponseFinancialModel.fromJson(json),
    )
        .toList();

    final responsePending = await apiService.get(
      endPoint: EndPoint.getEmployeeFinancialFalse,
    );
    final listPending =
    responsePending.data
        .map<ResponseFinancialModel>(
          (json) => ResponseFinancialModel.fromJson(json),
    )
        .toList();

    return [
      ...listReviewed,
      ...listPending,
    ];

  }

  @override
  Future<List<ResponseFinancialModel>>
  getReviewerFinancialRequest()
  async {
    final responseReviewed = await apiService.get(
      endPoint: EndPoint.getReviewerFinancialTrue,
    );
    final listReviewed =
    responseReviewed.data
        .map<ResponseFinancialModel>(
          (json) => ResponseFinancialModel.fromJson(json),
    )
        .toList();

    final responsePending = await apiService.get(
      endPoint: EndPoint.getReviewerFinancialFalse,
    );
    final listPending =
    responsePending.data
        .map<ResponseFinancialModel>(
          (json) => ResponseFinancialModel.fromJson(json),
    )
        .toList();

    return [
      ...listReviewed,
      ...listPending,
    ];

  }

}
