import 'package:equatable/equatable.dart';
import '../../../data/model/alert_model.dart';

class GetAlertsOverTimeState extends Equatable {
  final bool? isLoading;
  final String? errorMessage;
  final List<AlertModel>? response;
  final List<AlertModel>? listOverTimeSelected;
  final AlertModel? selectedRequestType;


  const GetAlertsOverTimeState({
    this.selectedRequestType,
    this.isLoading = false,
    this.errorMessage,
    this.response,
    this.listOverTimeSelected,
  });

  copyWith({
    bool? isLoading,
    String? errorMessage,
    List<AlertModel>? response,
    AlertModel? selectedRequestType,
    List<AlertModel>? listOverTimeSelected,
  }) {
    return GetAlertsOverTimeState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      response: response ?? this.response,
      selectedRequestType: selectedRequestType ?? this.selectedRequestType,
      listOverTimeSelected: listOverTimeSelected ?? this.listOverTimeSelected,
    );
  }

  @override
  List<Object?> get props => [
    response,
    selectedRequestType,
    isLoading,
    errorMessage,
    listOverTimeSelected

  ];
}
