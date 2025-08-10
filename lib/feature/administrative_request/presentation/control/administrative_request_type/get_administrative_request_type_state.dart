
import 'package:employee_portal_mobile_app/feature/administrative_request/data/model/administrative_request_type_model.dart';
import 'package:equatable/equatable.dart';

class GetAdministrativeRequestTypeState extends Equatable{
  final bool ?isLoading ;
  final  String? errorMessage;
  final List<AdministrativeRequestTypeModel>? response;
  final  AdministrativeRequestTypeModel? selectedRequestType;


  const GetAdministrativeRequestTypeState({this.selectedRequestType, this.isLoading= false, this.errorMessage, this.response});


  copyWith({
    bool? isLoading,
    String? errorMessage,
    List<AdministrativeRequestTypeModel>? response,
    AdministrativeRequestTypeModel? selectedRequestType

  }) {
    return GetAdministrativeRequestTypeState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      response: response ?? this.response,
        selectedRequestType: selectedRequestType??this.selectedRequestType
    );

  }
  @override
  List<Object?> get props => [response, selectedRequestType, isLoading, errorMessage];

}