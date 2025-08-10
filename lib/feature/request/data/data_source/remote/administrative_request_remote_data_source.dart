import '../../model/financial_request_type_model.dart';
import '../../model/request_post_administrative_request_model.dart';
import '../../model/response_admin_financial_model.dart';
import '../../model/response_post_administrative_request.dart';

abstract class AdministrativeRequestRemoteDataSource {
  Future<List<FinancialRequestTypeModel>> getAdminRequestType();
  Future<List<ResponseAdminFinancialModel>> getEmployeeAdministrativeRequest();
  Future<List<ResponseAdminFinancialModel>> getReviewerAdministrativeRequest();
  Future<ResponsePostAdministrativeFinancialRequest> postAdministrativeRequest({
    required RequestPostAdministrativeFinancialRequestModel requestPostAdministrativeRequestModel,
  });
}
