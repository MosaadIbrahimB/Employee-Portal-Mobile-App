import 'package:employee_portal_mobile_app/core/service/api_service/api_service.dart';
import 'package:employee_portal_mobile_app/core/utils/end_point.dart';
import 'package:employee_portal_mobile_app/feature/request/data/data_source/remote/request_remote_data_source.dart';
import 'package:employee_portal_mobile_app/feature/request/data/model/employee_reviewed_financial_request_model.dart';
import 'package:employee_portal_mobile_app/feature/request/data/model/financial_request_type_model.dart';

class RequestRemoteImplDio implements RequestRemoteDataSource {
  final ApiService apiService;

  RequestRemoteImplDio({required this.apiService});

  @override
  Future<List<FinancialRequestTypeModel>> getFinancialRequestType() async {
    final response = await apiService.getRequest(
      endPoint: EndPoint.getRequestFinancial,
    );
    final responseAdministrative = await apiService.getRequest(
      endPoint: EndPoint.getRequestAdministrative,
    );
    final financialList =
        response.data
            .map<FinancialRequestTypeModel>(
              (json) => FinancialRequestTypeModel.fromJson(json),
            )
            .toList();
    final adminList =
        responseAdministrative.data
            .map<FinancialRequestTypeModel>(
              (json) => FinancialRequestTypeModel.fromJson(json),
            )
            .toList();
    List<FinancialRequestTypeModel> listFromApi = [
      ...financialList,
      ...adminList,
    ];
    return listFromApi;
  }

  @override
  Future<List<EmployeeReviewedFinancialRequestModel>>
  getEmployeeReviewedAdministrativeRequest() async {
    {
      final response = await apiService.getRequest(
        endPoint: EndPoint.getEmployeeReviewedFinancialRequest,
      );
      final list =
          response.data
              .map<EmployeeReviewedFinancialRequestModel>(
                (json) => EmployeeReviewedFinancialRequestModel.fromJson(json),
              )
              .toList();
      return list;
    }
  }
}
