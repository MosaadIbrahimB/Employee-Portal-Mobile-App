import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_case/get_reviewer_loan_use_case.dart';
import 'get_reviewer_loan_state.dart';

class GetReviewerLoanCubit extends Cubit<GetReviewerLoanState> {
  GetReviewerLoanCubit({required this.getReviewerLoanUseCase})
    : super(GetReviewerLoanState());
  GetReviewerLoanUseCase getReviewerLoanUseCase;

  getEmployeeLoan() async {
    emit(state.copyWith(isLoading: true));
    final response = await getReviewerLoanUseCase();
    response.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, errorMessage: failure.message));
      },
      (resulte) {
        emit(state.copyWith(isLoading: false, response: resulte));
      },
    );
  }
}
