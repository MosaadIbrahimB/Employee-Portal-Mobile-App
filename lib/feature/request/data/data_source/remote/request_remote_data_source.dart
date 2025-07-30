import 'package:employee_portal_mobile_app/feature/request/data/model/financial_request_type_model.dart';
import '../../model/employee_reviewed_financial_request_model.dart';

abstract class RequestRemoteDataSource {
  Future<List<FinancialRequestTypeModel>> getFinancialRequestType();
  Future<List<EmployeeReviewedFinancialRequestModel>> getEmployeeReviewedAdministrativeRequest();
}
