import 'package:equatable/equatable.dart';
import '../../../data/model/alert_model.dart';
import '../../../data/model/response_over_time_model.dart';
class GetReviewerOverTimeState extends Equatable {
  final bool? isLoading;
  final String? errorMessage;
  final List<ResponseOverTimeModel>? response;
  final ResponseOverTimeModel? selectedRequestType;

  const GetReviewerOverTimeState({
    this.selectedRequestType,
    this.isLoading = false,
    this.errorMessage,
    this.response,
  });

  copyWith({
    bool? isLoading,
    String? errorMessage,
    List<ResponseOverTimeModel>? response,
    ResponseOverTimeModel? selectedRequestType,
  }) {
    return GetReviewerOverTimeState(
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
