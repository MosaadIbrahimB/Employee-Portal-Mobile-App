import 'package:employee_portal_mobile_app/core/service/api_service/api_service.dart';
import 'package:employee_portal_mobile_app/core/utils/end_point.dart';
import 'package:employee_portal_mobile_app/feature/request/data/data_source/remote/request_remote_data_source.dart';
import 'package:employee_portal_mobile_app/feature/request/data/model/request_post_administrative_request_model.dart';
import 'package:employee_portal_mobile_app/feature/request/data/model/response_admin_financial_model.dart';
import 'package:employee_portal_mobile_app/feature/request/data/model/financial_request_type_model.dart';
import 'package:employee_portal_mobile_app/feature/request/data/model/response_post_administrative_request.dart';

class RequestRemoteImplDio implements RequestRemoteDataSource {
  final ApiService apiService;

  RequestRemoteImplDio({required this.apiService});

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
  Future<List<FinancialRequestTypeModel>> getAdminRequestType()  async {

    final responseAdministrative = await apiService.getRequest(
      endPoint: EndPoint.getRequestAdministrative,
    );

    final adminList =
    responseAdministrative.data
        .map<FinancialRequestTypeModel>(
          (json) => FinancialRequestTypeModel.fromJson(json),
    )
        .toList();

    return adminList;
  }





  @override
  Future<List<ResponseAdminFinancialModel>>
  getEmployeeAdministrativeRequest()
  async {
    {
      final responseReviewed = await apiService.getRequest(endPoint: EndPoint.getEmployeeReviewedAdministrativeRequest);
      final listReviewed  = responseReviewed.data.map<ResponseAdminFinancialModel>((json) => ResponseAdminFinancialModel.fromJson(json),).toList();

      final responsePending = await apiService.getRequest(endPoint: EndPoint.getEmployeePendingAdministrativeRequest);
      final listPending  = responsePending.data.map<ResponseAdminFinancialModel>((json) => ResponseAdminFinancialModel.fromJson(json),).toList();


      return [
        ...listReviewed,
        ...listPending,
      ];




      return   ResponseAdminFinancialModel.sampleFinancialRequests;
    }
  }

  @override
  Future<List<ResponseAdminFinancialModel>> getReviewerAdministrativeRequest()
  async {
    {
      final responseReviewed = await apiService.getRequest(endPoint: EndPoint.getReviewerReviewedAdministrativeRequest);
      final listReviewed  = responseReviewed.data.map<ResponseAdminFinancialModel>((json) => ResponseAdminFinancialModel.fromJson(json),).toList();

      final responsePending = await apiService.getRequest(endPoint: EndPoint.getReviewerPendingAdministrativeRequest);
      final listPending  = responsePending.data.map<ResponseAdminFinancialModel>((json) => ResponseAdminFinancialModel.fromJson(json),).toList();


      return [
        ...listReviewed,
        ...listPending,
      ];

      return   ResponseAdminFinancialModel.sampleFinancialRequests;
    }
  }

  @override
  Future<ResponsePostAdministrativeFinancialRequest> postAdministrativeRequest({required RequestPostAdministrativeFinancialRequestModel requestPostAdministrativeRequestModel})
  async {
    {
      final response = await apiService.postRequest(
        endPoint: EndPoint.postRequest,
        data: requestPostAdministrativeRequestModel.toJson(),

      );
      return ResponsePostAdministrativeFinancialRequest.fromJson(response.data);


    }
  }

  @override
  Future<List<ResponseAdminFinancialModel>> getEmployeeFinancialRequest()
  async {
    {
      final responseReviewed = await apiService.getRequest(endPoint: EndPoint.getEmployeeReviewedFinancialRequest);
      final listReviewed  = responseReviewed.data.map<ResponseAdminFinancialModel>((json) => ResponseAdminFinancialModel.fromJson(json),).toList();

      final responsePending = await apiService.getRequest(endPoint: EndPoint.getEmployeePendingFinancialRequests);
      final listPending  = responsePending.data.map<ResponseAdminFinancialModel>((json) => ResponseAdminFinancialModel.fromJson(json),).toList();


      // return [
      //   ...listReviewed,
      //   ...listPending,
      // ];




      return   ResponseAdminFinancialModel.sampleFinancialRequests;
    }
  }

  @override
  Future<List<ResponseAdminFinancialModel>> getReviewerFinancialRequest()
  async {
    {
      final responseReviewed = await apiService.getRequest(endPoint: EndPoint.getReviewerReviewedFinancialRequests);
      final listReviewed  = responseReviewed.data.map<ResponseAdminFinancialModel>((json) => ResponseAdminFinancialModel.fromJson(json),).toList();

      final responsePending = await apiService.getRequest(endPoint: EndPoint.getReviewerPendingAdministrativeRequest);
      final listPending  = responsePending.data.map<ResponseAdminFinancialModel>((json) => ResponseAdminFinancialModel.fromJson(json),).toList();


      // return [
      //   ...listReviewed,
      //   ...listPending,
      // ];

      return   ResponseAdminFinancialModel.sampleFinancialRequests;
    }
  }






}
