import 'package:employee_portal_mobile_app/feature/request/data/model/financial_request_type_model.dart';
import '../../model/request_post_administrative_request_model.dart';
import '../../model/response_admin_financial_model.dart';
import '../../model/response_post_administrative_request.dart';

abstract class RequestRemoteDataSource {
  Future<List<FinancialRequestTypeModel>> getAdminRequestType();
  Future<List<ResponseAdminFinancialModel>> getEmployeeAdministrativeRequest();
  Future<List<ResponseAdminFinancialModel>> getReviewerAdministrativeRequest();
  Future<ResponsePostAdministrativeRequest> postAdministrativeRequest({
    required RequestPostAdministrativeRequestModel requestPostAdministrativeRequestModel,
  });
  //Financial
  Future<List<FinancialRequestTypeModel>> getFinancialRequestType();
  Future<List<ResponseAdminFinancialModel>> getEmployeeFinancialRequest();
}

