import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_case/get_loan_use_case.dart';
import 'get_loan_state.dart';

class GetLoanCubit extends Cubit<GetLoanState> {
  GetLoanCubit({required this.getLoanUseCase})
    : super(GetLoanState());
  GetLoanUseCase getLoanUseCase;

  getLoan() async {
    emit(state.copyWith(isLoading: true));
    final response = await getLoanUseCase();
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
