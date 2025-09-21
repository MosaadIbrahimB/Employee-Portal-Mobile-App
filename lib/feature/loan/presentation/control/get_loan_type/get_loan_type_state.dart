import 'package:equatable/equatable.dart';
import '../../../data/model/loan_type_model.dart';
import '../../../data/model/response_loan_model.dart';

class GetLoanTypeState extends Equatable {
  final bool? isLoading;
  final String? errorMessage;
  final List<LoanTypeModel>? response;
  final LoanTypeModel? selectedRequestType;

  const GetLoanTypeState({
    this.selectedRequestType,
    this.isLoading = false,
    this.errorMessage,
    this.response,
  });

  copyWith({
    bool? isLoading,
    String? errorMessage,
    List<LoanTypeModel>? response,
    LoanTypeModel? selectedRequestType,
  }) {
    return GetLoanTypeState(
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
