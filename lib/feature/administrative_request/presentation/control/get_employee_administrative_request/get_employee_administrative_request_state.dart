import 'package:employee_portal_mobile_app/feature/administrative_request/data/model/response_administrative_model.dart';
import 'package:equatable/equatable.dart';

class GetEmployeeAdministrativeRequestState extends Equatable{
  final bool ?isLoading ;
  final  String? errorMessage;
  final List<ResponseAdministrativeModel>? response;


  const GetEmployeeAdministrativeRequestState({ this.isLoading= false, this.errorMessage, this.response});


  copyWith({
    bool? isLoading,
    String? errorMessage,
    List<ResponseAdministrativeModel>? response,
    ResponseAdministrativeModel? selectedRequestType

  }) {
    return GetEmployeeAdministrativeRequestState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      response: response ?? this.response,
    );

  }
  @override
  List<Object?> get props => [response, isLoading, errorMessage];

}