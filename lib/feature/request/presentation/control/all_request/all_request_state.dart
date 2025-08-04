import 'package:employee_portal_mobile_app/feature/request/data/model/response_admin_financial_model.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/control/get_employee_administrative_request/get_employee_administrative_request_state.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/financial_request_type_model.dart';

class AllRequestState extends Equatable{
  final bool ?isLoading ;
  final  String? errorMessage;
  final List<ResponseAdminFinancialModel>? response;


  const AllRequestState({ this.isLoading= false, this.errorMessage, this.response});


  copyWith({
    bool? isLoading,
    String? errorMessage,
    List<ResponseAdminFinancialModel>? response,

  }) {
    return AllRequestState(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        response: response ?? this.response,
    );

  }
  @override
  List<Object?> get props => [response,  isLoading, errorMessage];

}