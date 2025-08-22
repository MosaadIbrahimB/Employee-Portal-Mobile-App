import 'package:equatable/equatable.dart';
import '../../../data/model/response_permission_request_model.dart';

class GetEmployeePerMissionRequestState extends Equatable {
  final bool? isLoading;
  final String? errorMessage;
  final List<ResponsePermissionRequestModel>? response;
  final ResponsePermissionRequestModel? selectedRequestType;

  const GetEmployeePerMissionRequestState({
    this.selectedRequestType,
    this.isLoading = false,
    this.errorMessage,
    this.response,
  });

  copyWith({
    bool? isLoading,
    String? errorMessage,
    List<ResponsePermissionRequestModel>? response,
    ResponsePermissionRequestModel? selectedRequestType,
  }) {
    return GetEmployeePerMissionRequestState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      response: response ?? this.response,
      selectedRequestType: selectedRequestType ?? this.selectedRequestType,
    );
  }

  @override
  List<Object?> get props => [
    response,
    selectedRequestType,
    isLoading,
    errorMessage,
  ];
}
