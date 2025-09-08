import 'package:equatable/equatable.dart';
import '../../../data/model/alert_model.dart';

class GetAlertOverTimeState extends Equatable {
  final bool? isLoading;
  final String? errorMessage;
  final AlertModel? response;
  final AlertModel? selectedRequestType;

  const GetAlertOverTimeState({
    this.selectedRequestType,
    this.isLoading = false,
    this.errorMessage,
    this.response,
  });

  copyWith({
    bool? isLoading,
    String? errorMessage,
    AlertModel? response,
    AlertModel? selectedRequestType,
  }) {
    return GetAlertOverTimeState(
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
