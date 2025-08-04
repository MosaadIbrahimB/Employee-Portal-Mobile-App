import 'package:equatable/equatable.dart';

import '../../../data/model/financial_request_type_model.dart';

class GetAdminRequestTypeState extends Equatable{
  final bool ?isLoading ;
  final  String? errorMessage;
  final List<FinancialRequestTypeModel>? response;
  final  FinancialRequestTypeModel? selectedRequestType;


  const GetAdminRequestTypeState({this.selectedRequestType, this.isLoading= false, this.errorMessage, this.response});


  copyWith({
    bool? isLoading,
    String? errorMessage,
    List<FinancialRequestTypeModel>? response,
    FinancialRequestTypeModel? selectedRequestType

  }) {
    return GetAdminRequestTypeState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      response: response ?? this.response,
        selectedRequestType: selectedRequestType??this.selectedRequestType
    );

  }
  @override
  List<Object?> get props => [response, selectedRequestType, isLoading, errorMessage];

}