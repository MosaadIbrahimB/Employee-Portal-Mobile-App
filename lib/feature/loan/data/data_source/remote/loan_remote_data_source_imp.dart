import 'package:employee_portal_mobile_app/feature/loan/data/model/get_loan_model.dart';
import 'package:employee_portal_mobile_app/feature/loan/data/model/loan_type_model.dart';
import 'package:employee_portal_mobile_app/feature/loan/data/model/post/post_loan_request_model.dart';
import 'package:employee_portal_mobile_app/feature/loan/data/model/post/post_loan_response_model.dart';
import 'package:employee_portal_mobile_app/feature/loan/data/model/response_loan_model.dart';
import 'package:employee_portal_mobile_app/feature/loan/data/model/valid/validate_loan_request_model.dart';
import 'package:employee_portal_mobile_app/feature/loan/data/model/valid/validate_loan_response_model.dart';
import '../../../../../core/service/api_service/dio_consumer.dart';
import '../../../../../core/utils/end_point.dart';
import '../loan_remote_data_source.dart';

class LoanRemoteDataSourceImp implements LoanRemoteDataSource  {
  final DioConsumer apiService;

  LoanRemoteDataSourceImp({required this.apiService});

  @override
  Future<List<LoanModel>> getEmployeeLoan()
  async {
    final responseReviewed = await apiService.get(
      endPoint: EndPoint.getEmployeeLoanTrue,
    );
    final listReviewed =
    responseReviewed.data
        .map<LoanModel>(
          (json) => LoanModel.fromJson(json),
    )
        .toList();

    final responsePending = await apiService.get(
      endPoint: EndPoint.getEmployeeLoanFalse,
    );
    final listPending =
    responsePending.data
        .map<LoanModel>(
          (json) => LoanModel.fromJson(json),
    )
        .toList();

    return [...listReviewed, ...listPending];
  }


  @override
  Future<List<GetLoanModel>> getLoan()
  async {
    final response = await apiService.get(
      endPoint: EndPoint.getLoan,
    );

    final List<GetLoanModel> list =
    response.data
        .map<LoanTypeModel>((json) => GetLoanModel.fromJson(json))
        .toList();

    return list;
  }

  @override
  Future<List<LoanTypeModel>> getLoanType()
  async {
    final response = await apiService.get(
      endPoint: EndPoint.getTypeLoan,
    );

    final List<LoanTypeModel> list =
    response.data
        .map<LoanTypeModel>((json) => LoanTypeModel.fromJson(json))
        .toList();

    return list;
  }


  @override
  Future<List<LoanModel>> getReviewerLoan()
  async {
    final responseReviewed = await apiService.get(
      endPoint: EndPoint.getReviewerLoanTrue,
    );
    final listReviewed =
    responseReviewed.data
        .map<LoanModel>(
          (json) => LoanModel.fromJson(json),
    )
        .toList();

    final responsePending = await apiService.get(
      endPoint: EndPoint.getReviewerLoanFalse,
    );
    final listPending =
    responsePending.data
        .map<LoanModel>(
          (json) => LoanModel.fromJson(json),
    )
        .toList();

    return [...listReviewed, ...listPending];
  }


  @override
  Future<PostLoanResponseModel> postLoan({required PostLoanRequestModel requestPostLoanModel})
  async {
    final response = await apiService.post(
      endPoint: EndPoint.postLoan,
      data: requestPostLoanModel.toJson(),
    );
    return PostLoanResponseModel.fromJson(response.data);
  }


  @override
  Future<ValidateLoanResponseModel> validateLoan({required ValidateLoanRequestModel requestModel})
  async {
    final response = await apiService.get(
      endPoint: EndPoint.validateLoan,
      queryParams: requestModel.toQueryParams(),
    );
    return ValidateLoanResponseModel.fromJson(response.data);
  }
}