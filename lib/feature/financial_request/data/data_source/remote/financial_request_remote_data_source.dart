import 'package:employee_portal_mobile_app/feature/financial_request/data/model/financial_request_type_model.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/model/request_post_financial_request_model.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/model/response_financial_model.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/model/response_post_financial_request.dart';

abstract class FinancialRequestRemoteDataSource {

  Future<List<FinancialRequestTypeModel>> getFinancialRequestType();
  Future<List<ResponseFinancialModel>> getEmployeeFinancialRequest();
  Future<List<ResponseFinancialModel>> getReviewerFinancialRequest();
  Future<ResponsePostFinancialRequest> postFinancialRequest({
    required RequestPostFinancialRequestModel requestPostFinancialRequestModel,
  });
}
