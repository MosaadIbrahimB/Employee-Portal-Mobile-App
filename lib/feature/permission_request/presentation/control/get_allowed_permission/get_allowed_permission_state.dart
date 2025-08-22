import 'package:equatable/equatable.dart';

import '../../../data/model/get_allowed_permission_model.dart';

class GetAllowedPerMissionRequestState extends Equatable {
  final bool? isLoading;
  final String? errorMessage;
  final List<GetAllowedPermissionModel>? response;
  final GetAllowedPermissionModel? selectedRequestType;

  const GetAllowedPerMissionRequestState({
    this.selectedRequestType,
    this.isLoading = false,
    this.errorMessage,
    this.response,
  });

  copyWith({
    bool? isLoading,
    String? errorMessage,
    List<GetAllowedPermissionModel>? response,
    GetAllowedPermissionModel? selectedRequestType,
  }) {
    return GetAllowedPerMissionRequestState(
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
