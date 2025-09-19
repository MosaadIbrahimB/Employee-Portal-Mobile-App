import 'package:equatable/equatable.dart';
import '../../../data/model/get_loan_model.dart';

class GetLoanState extends Equatable {
  final bool? isLoading;
  final String? errorMessage;
  final List<GetLoanModel>? response;
  final GetLoanModel? selectedRequestType;

  const GetLoanState({
    this.selectedRequestType,
    this.isLoading = false,
    this.errorMessage,
    this.response,
  });

  copyWith({
    bool? isLoading,
    String? errorMessage,
    List<GetLoanModel>? response,
    GetLoanModel? selectedRequestType,
  }) {
    return GetLoanState(
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
