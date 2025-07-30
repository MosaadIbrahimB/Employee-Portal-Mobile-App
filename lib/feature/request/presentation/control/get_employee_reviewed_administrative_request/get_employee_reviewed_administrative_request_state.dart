import 'package:equatable/equatable.dart';
import '../../../data/model/employee_reviewed_financial_request_model.dart';
import '../../../data/model/financial_request_type_model.dart';

class GetEmployeeReviewedAdministrativeRequestState extends Equatable{
  final bool ?isLoading ;
  final  String? errorMessage;
  final List<EmployeeReviewedFinancialRequestModel>? response;


  const GetEmployeeReviewedAdministrativeRequestState({ this.isLoading= false, this.errorMessage, this.response});


  copyWith({
    bool? isLoading,
    String? errorMessage,
    List<EmployeeReviewedFinancialRequestModel>? response,
    FinancialRequestTypeModel? selectedRequestType

  }) {
    return GetEmployeeReviewedAdministrativeRequestState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      response: response ?? this.response,
    );

  }
  @override
  List<Object?> get props => [response, isLoading, errorMessage];

}