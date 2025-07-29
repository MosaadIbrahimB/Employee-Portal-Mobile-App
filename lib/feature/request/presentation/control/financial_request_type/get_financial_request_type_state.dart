import 'package:equatable/equatable.dart';

import '../../../data/model/financial_request_type_model.dart';

class GetFinancialRequestTypeState extends Equatable{
  final bool ?isLoading ;
  final  String? errorMessage;
  final List<FinancialRequestTypeModel>? response;
  final  FinancialRequestTypeModel? selectedRequestType;


  const GetFinancialRequestTypeState({this.selectedRequestType, this.isLoading= false, this.errorMessage, this.response});


  copyWith({
    bool? isLoading,
    String? errorMessage,
    List<FinancialRequestTypeModel>? response,
    FinancialRequestTypeModel? selectedRequestType

  }) {
    return GetFinancialRequestTypeState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      response: response ?? this.response,
        selectedRequestType: selectedRequestType??this.selectedRequestType
    );

  }
  @override
  List<Object?> get props => [response, selectedRequestType, isLoading, errorMessage];

}