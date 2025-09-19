import 'package:employee_portal_mobile_app/feature/loan/presentation/control/validate_loan/validate_loan_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/valid/validate_loan_request_model.dart';
import '../../../domain/use_case/validate_loan_use_case.dart';

class ValidateLoanCubit extends Cubit<ValidateLoanState> {
  final ValidateLoanUseCase validateLoanUseCase;

  ValidateLoanCubit({required this.validateLoanUseCase}) : super(const ValidateLoanState());

  static final TextEditingController noteInputController = TextEditingController();

  Future<void> validateLoan({
    required ValidateLoanRequestModel requestModel,
  }) async {
    emit(state.copyWith(isLoading: true,response: null, errorMessage: null));

    final result = await validateLoanUseCase(requestModel: requestModel);

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, errorMessage: failure.message));
      },
      (responseList) {
        emit(state.copyWith(isLoading: false, response: responseList));
      },
    );
  }
}
