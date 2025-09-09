import 'package:equatable/equatable.dart';
import '../../../data/model/alert_model.dart';
import '../../../data/model/type_over_time_model.dart';

class GetTypeOverTimeState extends Equatable {
  final bool? isLoading;
  final String? errorMessage;
  final List<TypeOverTimeModel>? response;
  final TypeOverTimeModel? selectedRequestType;

  const GetTypeOverTimeState({
    this.selectedRequestType,
    this.isLoading = false,
    this.errorMessage,
    this.response,
  });

  copyWith({
    bool? isLoading,
    String? errorMessage,
    List<TypeOverTimeModel>? response,
    TypeOverTimeModel? selectedRequestType,
  }) {
    return GetTypeOverTimeState(
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
