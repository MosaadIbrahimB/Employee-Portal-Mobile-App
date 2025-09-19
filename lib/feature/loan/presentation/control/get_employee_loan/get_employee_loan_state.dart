import 'package:equatable/equatable.dart';
import '../../../data/model/response_loan_model.dart';

class GetEmployeeLoanState extends Equatable {
  final bool? isLoading;
  final String? errorMessage;
  final List<LoanModel>? response;
  final LoanModel? selectedRequestType;

  const GetEmployeeLoanState({
    this.selectedRequestType,
    this.isLoading = false,
    this.errorMessage,
    this.response,
  });

  copyWith({
    bool? isLoading,
    String? errorMessage,
    List<LoanModel>? response,
    LoanModel? selectedRequestType,
  }) {
    return GetEmployeeLoanState(
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
