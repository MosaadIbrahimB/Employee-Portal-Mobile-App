import 'package:equatable/equatable.dart';

import '../../../data/model/financial_request_type_model.dart';
import '../../../data/model/response_admin_financial_model.dart';

class GetEmployeeFinancialRequestState extends Equatable{
  final bool ?isLoading ;
  final  String? errorMessage;
  final List<ResponseAdminFinancialModel>? response;


  const GetEmployeeFinancialRequestState({ this.isLoading= false, this.errorMessage, this.response});


  copyWith({
    bool? isLoading,
    String? errorMessage,
    List<ResponseAdminFinancialModel>? response,
    FinancialRequestTypeModel? selectedRequestType

  }) {
    return GetEmployeeFinancialRequestState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      response: response ?? this.response,
    );

  }
  @override
  List<Object?> get props => [response, isLoading, errorMessage];

}