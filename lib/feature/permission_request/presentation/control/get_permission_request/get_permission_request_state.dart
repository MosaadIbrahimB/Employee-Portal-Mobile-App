import 'package:equatable/equatable.dart';
import '../../../data/model/get_permissions_model.dart';

class GetPerMissionRequestState extends Equatable {
  final bool? isLoading;
  final String? errorMessage;
  final List<GetPermissionsModel>? response;
  final GetPermissionsModel? selectedRequestType;

  const GetPerMissionRequestState({
    this.selectedRequestType,
    this.isLoading = false,
    this.errorMessage,
    this.response,
  });

  copyWith({
    bool? isLoading,
    String? errorMessage,
    List<GetPermissionsModel>? response,
    GetPermissionsModel? selectedRequestType,
  }) {
    return GetPerMissionRequestState(
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
