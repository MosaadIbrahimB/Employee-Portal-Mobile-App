import 'package:employee_portal_mobile_app/feature/financial_request/data/model/response_financial_model.dart';
import 'package:equatable/equatable.dart';

class GetReviewerFinancialRequestState extends Equatable{
  final bool ?isLoading ;
  final  String? errorMessage;
  final List<ResponseFinancialModel>? response;


  const GetReviewerFinancialRequestState({ this.isLoading= false, this.errorMessage, this.response});


  copyWith({
    bool? isLoading,
    String? errorMessage,
    List<ResponseFinancialModel>? response,
    ResponseFinancialModel? selectedRequestType

  }) {
    return GetReviewerFinancialRequestState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      response: response ?? this.response,
    );

  }
  @override
  List<Object?> get props => [response, isLoading, errorMessage];

}