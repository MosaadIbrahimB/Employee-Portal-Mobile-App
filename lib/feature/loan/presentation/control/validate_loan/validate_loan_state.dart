import 'package:equatable/equatable.dart';
import '../../../data/model/post/post_loan_response_model.dart';
import '../../../data/model/valid/validate_loan_response_model.dart';

class ValidateLoanState extends Equatable {
  final bool ?isLoading;
  final ValidateLoanResponseModel? response;
  final String? errorMessage;

  const ValidateLoanState({
    this.isLoading = false,
    this.response,
    this.errorMessage,
  })  ;

  ValidateLoanState copyWith({
    bool? isLoading,
    final ValidateLoanResponseModel? response,
    String? errorMessage,
  }) {

    return ValidateLoanState(
      isLoading: isLoading?? this.isLoading,
      response: response ,
      errorMessage: errorMessage ,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    response,
    errorMessage,

  ];
}

