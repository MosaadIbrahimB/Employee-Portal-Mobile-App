import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_case/get_employee_loan_use_case.dart';
import 'get_employee_loan_state.dart';

class GetEmployeeLoanCubit extends Cubit<GetEmployeeLoanState> {
  GetEmployeeLoanCubit({required this.getEmployeeLoanUseCase})
    : super(GetEmployeeLoanState());
  GetEmployeeLoanUseCase getEmployeeLoanUseCase;

  getEmployeeLoan() async {
    emit(state.copyWith(isLoading: true));
    final response = await getEmployeeLoanUseCase();
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
